//
//  MapView.swift
//  lumiar-fortaleza
//
//  Created by user on 24/04/26.
//

import SwiftData
import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Namespace var mapScope
  
    @Query private var locations: [Location]

    @State private var isPresented: Bool = true
    
    @State private var selected: Location?
        
    @State var searchResults: [Location] = []
    
    @State private var searchText: String = ""
    
    @State private var presentingSearchBottomBar: Bool = true
    @State private var isSearching: Bool = false
    

    //    @State private var route = MKRoute?
    
    @State var currentPresentationDetent: PresentationDetent = .fraction(0.1)
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -3.71382, longitude: -38.47057),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    @Query var markers: [Location]
    
//    * Configuração para barra de pesquisa*
//    var isSearching: Bool {
//        return !searchText.isEmpty
//    }

    
    let cameraPosition: MapCameraPosition = .region(.init(center: .init(latitude: -3.763, longitude: -38.5267), latitudinalMeters: 20000, longitudinalMeters: 20000))
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Map (initialPosition: cameraPosition){
                    ForEach(markers) { marker in
                        Annotation(marker.name, coordinate: marker.coordinates) {
                            ZStack {
                                Circle()
                                    .foregroundStyle(marker.category.iconColor)
                                    .frame(width: 46, height: 46)
                                Button ( action: {
                                    selected = marker
                                    currentPresentationDetent = .medium
                                    let adjustedCenter = CLLocationCoordinate2D(
                                        latitude: marker.latitude - 0.005,
                                        longitude: marker.longitude
                                    )
                                    withAnimation(.easeInOut(duration: 1.0)) {
                                        position = .region(
                                            MKCoordinateRegion(
                                                center: adjustedCenter,
                                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                                            )
                                        )
                                    }
                                    
                                }) {
                                    Image(marker.imageName)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(50)
                                        .scaledToFill()
                                    
                                }
                            }
                            //            if let route {
                            //                MapPolyline(route)
                            //                    .stroke(Color.blue, lineWidth: 2)
                            //            }
                            
                        }
                    }
                    
                }
                .mapControls {
                    MapCompass()
                    MapUserLocationButton()
                    MapScaleView()
                }
                .onChange(of: currentPresentationDetent) {
                    if currentPresentationDetent == .fraction(0.1) {
                        selected = nil
                    }
                }
                .sheet(isPresented: $isPresented) {
                    let content = HStack {
                        if let selected {
                            LocationContentSheetView(location: selected)
                        } else {
                            // TODO: ajustar para ir para página do local e quando sair ele sair para o normal da sheet
                            
                            ExploreContentSheetView(
                                searchText: $searchText,
                                isSearching: $isSearching
                            )
                            .padding(.top, currentPresentationDetent == .fraction(0.1) ? 12 : 0)
                            .searchable(
                                text: $searchText,
                                isPresented: $isSearching,
                                placement: .toolbarPrincipal,
                                prompt: "Buscar pontos"
                            )
                        }
                    }

                    
                    ZStack {
                        content
                    }
                    .presentationDetents(
                        [.fraction(0.1), .medium, .large],
                        selection: $currentPresentationDetent
                    )
                    .interactiveDismissDisabled(true)
                    .presentationBackgroundInteraction(
                        .enabled(
                            upThrough: .medium
                        )
                    )
                }
                .mapStyle(.standard(elevation: .realistic))
//                .ignoresSafeArea()
                .onTapGesture {
                    currentPresentationDetent = .fraction(0.1)
                }
                
                NavigationLink(destination: NeighbourhoodListView()) {
                    Image(systemName: "building.2.fill")
                        .padding(10)
                        .foregroundColor(.black)
                }
                .buttonStyle(.glass)
                .offset(x: 150, y: 250)
                
            }
            .onChange(of: isSearching, { _, newValue in
                if (isSearching) {
                    print("Ta pesquisando")
                    currentPresentationDetent = .medium
                }
            })
            .onChange(of: currentPresentationDetent, { _, newValue in
                if newValue == .fraction(0.1) {
                    selected = nil
                    isSearching = false
                    presentingSearchBottomBar = true
                } else {
                    presentingSearchBottomBar = false
                }
            })
            
        }
        .onChange(of: markers, { _, _ in
            print("Markers no SwiftData: \(markers.count)")
        })
        .onAppear {
            if markers.isEmpty {
                let locations = DataLoader.preloadDataV2()
                print(locations.count)
                for location in locations {
                    modelContext.insert(location)
                }
            }
        }
    }
    
    func getUserLocation() async -> CLLocationCoordinate2D? {
        let updates = CLLocationUpdate.liveUpdates()
        
        do {
            let updatedLocation = try await updates.first() { $0.location?.coordinate != nil }
            return updatedLocation?.location?.coordinate
        } catch {
            print("Cannot get user location")
            return nil
        }
    }
    
    func getDirections(to destination: CLLocationCoordinate2D) {
        Task {
            guard let userLocation = await getUserLocation() else { return }
            
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: .init(coordinate: userLocation))
            request.destination = MKMapItem(placemark: .init(coordinate: selected!.coordinates))
            request.transportType = .automobile
            
            do {
                let directions = try await MKDirections(request: request).calculate()
                //                route = directions.routes?.first
            } catch {
                print("Show error")
            }
        }
    }
}



#Preview {
    MapView()
}
