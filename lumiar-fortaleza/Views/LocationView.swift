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
                    
                    ScrollView{// Titulo e texto
                        Text(location.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(location.history)
                    }
                }
            }
            .padding(0)
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
}


#Preview {
}
