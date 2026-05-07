//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by user on 22/04/26.
//

import SwiftUI
import SwiftData
import MapKit

struct LocationView: View {
    
    
    var location: Location
    
    var body: some View {
        
        @Environment(\.dismiss) var dismiss
        @Environment(\.openURL) var openURL
        
        NavigationStack {
            VStack{
                VStack(alignment: .center , spacing: 15) {
                    
                    HStack(alignment: .center, spacing: 10){
                        CarouselView(location: location)
                        
                    }
                    .frame( minHeight: 150, maxHeight: 150 , alignment: .leading)
                    .cornerRadius(15)
                    .navigationTitle(location.name)
                    
                    VStack {
                        
                        // Botoes de rota e distância
                        HStack(alignment: .center, spacing: 10) {
                            RoutesButtonView(radius: 15)
                            DistanceInfoView(location: location)
                            
                            
                        }
                        .frame(maxWidth: .infinity, minHeight: 61, maxHeight: 61, alignment: .center)
                        
                    }
                    
                    ScrollView{ // Titulo e texto
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(location.subtitle)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading) // Garante que quebras de linha fiquem na esquerda
                            
                            Text(location.history)
                                .multilineTextAlignment(.leading)
                            
                        }
                    }
                    
                }
            }
            .padding(0)
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
}


#Preview {
    let location1 = Location(
        name: "Theatro José de Alencar",
        title: "Theatro José de Alencar",
        subtitle: "Um palco onde a arte constrói a história da cidade",
        address: "R. Liberato Barroso, 525 - Centro",
        history: "Inaugurado em 1910, o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza o Theatro José de Alencar é um dos principais patrimônios culturais de Fortaleza ...",
        category: .theater,
        neighbourhood: "Centro",
        imageName: "image_theatro_jose_de_alencar",
        coordinates: CLLocationCoordinate2D(latitude: -3.727480, longitude: -38.531670),
        comodities: [.bathroom, .acessibility] // Lista de enums
    )
    
    LocationView(location: location1)
        .modelContainer(for: Location.self, inMemory: true)
}
