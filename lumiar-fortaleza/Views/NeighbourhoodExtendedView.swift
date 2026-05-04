//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by Tainara & Ulisses on 24/04/26.
//

import SwiftUI
import SwiftData
import MapKit

struct NeighbourhoodExtendedView: View {
    @Query private var locations: [Location]
    
    var body: some View {
        
        List {
            ForEach(locations) { location in
                
                ZStack(alignment: .center) {
                    NavigationLink(destination: LocationView(location: location)) {
                        EmptyView()
                    }
                    .opacity(0)
                    
                    LocationExtendedCard(location: location)
                }
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }
}

#Preview {
    let locations = [
        Location(
            name: "Dragão",
            title: "Do mar",
            address: "Rua 25",
            history: "Muito massa",
            category: .museum,
            neighbourhood: "Centro",
            coordinates: CLLocationCoordinate2D(
                latitude: -3.727610,
                longitude: -38.527470
            ),
            comodities: [
                .acessibility,
                .bathroom,
                .park
            ]
        )
    ]
    
    let schema = Schema([
        Location.self
    ])
    
    let modelConfiguration = ModelConfiguration(
        schema: schema,
        isStoredInMemoryOnly: true
    )
    
    do {
        let container = try ModelContainer(
            for: schema,
            configurations: [modelConfiguration]
        )
        print("Conseguiu gerar o container!")
        
        for location in locations {
            container.mainContext.insert(location)
        }
        
        return NeighbourhoodExtendedView()
            .modelContainer(container)
    } catch {
        print("Não foi possível criar o Preview mockado!")
        print("\(error.localizedDescription)")
        print("\(error)")
        
        return NeighbourhoodExtendedView()
    }
    
    
    
}


