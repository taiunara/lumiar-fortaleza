//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by user on 24/04/26.
//

import SwiftUI

struct NeighbourhoodExtendedView: View {
    
    var body: some View {
        
        List {
            LocationExtendedCardView(location: location1)
                .listRowSeparator(.hidden)
            
            LocationExtendedCardView(location: location1)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
    }
}

struct NeighbourhoodExtendedView_Previews: PreviewProvider {
    static var previews: some View {
        NeighbourhoodExtendedView()
    }
}
