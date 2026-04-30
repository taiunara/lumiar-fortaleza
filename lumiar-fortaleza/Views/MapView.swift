//
//  MapView.swift
//  lumiar-fortaleza
//
//  Created by user on 24/04/26.
//

import SwiftUI
import MapKit



struct MapView: View {
    
    @Namespace var mapScope
    
    @State private var isPresented: Bool = true
    
    @State private var selected: Location?
    
    @State private var searchText: String = ""
    
    //    @State private var route = MKRoute?
    
    @State var currentPresentationDetent: PresentationDetent = .fraction(0.1)
    
    let markers = [
        location1,
        location2
    ]
    
    let cameraPosition: MapCameraPosition = .region(.init(center: .init(latitude: -3.763, longitude: -38.5267), latitudinalMeters: 20000, longitudinalMeters: 20000))
    
    var body: some View {
        NavigationStack{
            ZStack{
                Map (initialPosition: cameraPosition){
                    
                    ForEach(markers) { marker in
                        Annotation(marker.name, coordinate: marker.coordinates) {
                            Button ( action: {
                                selected = marker
                                currentPresentationDetent = .medium
                            }) {
                                Image(.imageTest1)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(50)
                                    .scaledToFill()
                            }
                            
                        }
                    }
                    //            if let route {
                    //                MapPolyline(route)
                    //                    .stroke(Color.blue, lineWidth: 2)
                    //            }
                    
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
                    NavigationStack {
                        HStack {
                            if let selected {
                                LocationContentSheetView()
                            } else {
                                ExploreContentSheetView()
                            }
                        }
                    }
                    .padding(.top, 10)
                    .searchable(text: $searchText, placement: .toolbarPrincipal, prompt: "Buscar pontos")
                    .presentationDetents([.fraction(0.1), .medium, .large], selection: $currentPresentationDetent)
                    .interactiveDismissDisabled(true)
                    .presentationBackgroundInteraction(.enabled(upThrough: .medium))
                }
                .mapStyle(.standard(elevation: .realistic))
                .ignoresSafeArea()
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
