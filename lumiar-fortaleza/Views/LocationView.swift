//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by user on 22/04/26.
//

import SwiftUI

struct LocationView: View {
    var body: some View {
        @Environment(\.dismiss) var dismiss
        @Environment(\.openURL) var openURL

        NavigationStack {
            ScrollView{
                VStack(alignment: .center , spacing: 15) {
                    
                    // TODO: Carrosel de fotos
                    HStack(alignment: .center, spacing: 10){
                        Image(.imageTest1)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .clipped()
                    }
                    .frame(maxHeight: .infinity, alignment: .leading)
                    .cornerRadius(15)
                    .navigationTitle(location1.name)
                    
                    VStack {
                        
                        // Botoes de rota e distância
                        HStack(alignment: .center, spacing: 10) {
                            RoutesButtonView(radius: 15)
                            DistanceInfoView()
                            
                            
                        }
                        .frame(maxWidth: .infinity, minHeight: 61, maxHeight: 61, alignment: .center)
                        
                    }
                    
                    // Titulo e texto
                    Text(location1.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location1.history)
                    
                }
            }
            .padding(0)
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
}


#Preview {
    LocationView()
}
