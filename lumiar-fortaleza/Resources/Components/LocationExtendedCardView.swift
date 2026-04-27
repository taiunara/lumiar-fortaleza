//
//  LocationExtendedCard.swift
//  lumiar-fortaleza
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct LocationExtendedCardView: View {
    
    let location: Location
    
    var body: some View {
        @Environment(\.dismiss) var dismiss

        // TODO: Ajeitar o frame da imagem para deixar padrão!
        
        VStack (alignment: .center, spacing: 20) {
            
            // Imagem do local
            Rectangle()
                .frame(width: .infinity)
                .frame(height: 180)
                .overlay {
                    Image(.imageTest1)
                        .resizable()
                        .scaledToFill()
                }
                .clipped()
            
            // Nome e pequena descrição do local
            VStack (alignment: .leading, spacing: 10) {
                Text(location.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location.title)
                }
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
           
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(1))
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.13), radius: 20, x: 0, y: 8)
        .listRowBackground(Color.clear)
        
    }
}

struct LocationExtendedCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationExtendedCardView(location: location1)
            .previewLayout(.sizeThatFits)
    }
}

