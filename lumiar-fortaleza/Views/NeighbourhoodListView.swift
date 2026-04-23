//
//  NeighbourhoodListView.swift
//  lumiar-fortaleza
//
//  Created by User on 23/04/26.
//
import SwiftUI

struct NeighbourhoodListView: View {
    
    @State var neighbourhoods: [Neighbourhood]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(neighbourhoods) { neighbourhood in
                    Text(neighbourhood.name)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var neighbourhoods: [Neighbourhood] = [
        Neighbourhood(name: "Benfica", locations: []),
        Neighbourhood(name: "Fátima", locations: []),
        Neighbourhood(name: "José Walter", locations: []),
        Neighbourhood(name: "Messejana", locations: [])
    ]
    
    NeighbourhoodListView(neighbourhoods: neighbourhoods)
}
