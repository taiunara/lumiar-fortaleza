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
    
    var body: some View {
        Map()
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
                .presentationDetents([.fraction(0.1), .medium,.large])
            
                .interactiveDismissDisabled(true)
                .presentationBackgroundInteraction(.enabled(upThrough: .medium))
        }
    }
}



#Preview {
    MapView()
}
