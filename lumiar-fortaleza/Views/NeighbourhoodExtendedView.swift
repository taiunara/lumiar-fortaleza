//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by Tainara & Ulisses on 24/04/26.
//

import SwiftUI

struct NeighbourhoodExtendedView: View {
    
    var body: some View {
        
        List {
            Section {
                LocationExtendedCard(location: location1)
                LocationExtendedCard(location: location2)
                LocationExtendedCard(location: location1)
            }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
        .navigationTitle(location1.name)
    }
}

struct NeighbourhoodExtendedView_Previews: PreviewProvider {
    static var previews: some View {
        NeighbourhoodExtendedView()
    }
}
