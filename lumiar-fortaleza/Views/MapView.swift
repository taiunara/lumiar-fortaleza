//
//  MapView.swift
//  lumiar-fortaleza
//
//  Created by user on 24/04/26.
//

import SwiftUI
import MapKit



struct MapView: View {
    
    @State var isPresented: Bool = true
    
    @State var selected: Location?
    
    @State var searchText: String = ""
    
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -3.7319, longitude: -38.5267),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )
    
    let markers = [
        location1,
        location2
    ]
    
    @State var currentPresentationDetent: PresentationDetent = .fraction(0.1)
    
    var body: some View {
        Map (position: $position){
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
                            Image(.imageTest1)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(50)
                                .scaledToFill()
                        }
                    }
                    
                }
            }
            
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
                        // TODO: ajustar para ir para página do local e quando sair ele sair para o normal da sheet
                        ExploreContentSheetView()
                    }
                }
            }
            .padding(.top, 10)
            .searchable(text: $searchText, placement: .toolbarPrincipal, prompt: "Buscar pontos")
            .presentationDetents([.fraction(0.1), .medium,.large], selection: $currentPresentationDetent)
            .interactiveDismissDisabled(true)
            .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
        .ignoresSafeArea()
        .onTapGesture {
            currentPresentationDetent = .fraction(0.1)
        }
    }
}



#Preview {
    MapView()
}
