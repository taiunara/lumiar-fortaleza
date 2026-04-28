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
    @State var searchText: String = ""
    
    let markers = [
            location1,
            location2
        ]
    
    @State var currentPresentationDetent: PresentationDetent = .fraction(0.1)
    
    var body: some View {
        Map{
            ForEach(markers) { marker in
                Annotation(location1.name, coordinate: marker.coordinates) {
                    Button ( action: {
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
        }
        .sheet(isPresented:  $isPresented) {
            NavigationStack {
                HStack {
                }.toolbar(content: {
            
                    ToolbarItem {
                        Button {
                            // Button actions here.
                        } label: {
                            Label("Mais", systemImage: "ellipsis")
                                .fontWeight(.medium)
                        }
//                        .buttonStyle(.glassProminent)
//                        .tint(.black.opacity(0.8))
                        .glassEffect(.identity.interactive())
                    }
                    
                })
            }
            .searchable(text: $searchText, placement: .automatic, prompt: "Buscar pontos")
                .presentationDetents([.fraction(0.1), .medium,.large], selection: $currentPresentationDetent)
            
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
    }
}



#Preview {
    MapView()
}
