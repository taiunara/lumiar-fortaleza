//
//  LocationExtendedCard.swift
//  lumiar-fortaleza
//
//  Created by Tainara & Ulisses on 24/04/26.
//

import SwiftUI

struct LocationExtendedCard: View {
    
    @Environment(\.dismiss) var dismiss
    let location: Location
    
    var body: some View {

        // TODO: Ajeitar o frame da imagem para deixar padrão!
        
        VStack (alignment: .leading, spacing: 20) {
            
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
            .padding(.horizontal, 10)
           
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(1))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .shadow(color: .black.opacity(0.13), radius: 20, x: 0, y: 8)
        
    }
}

struct LocationExtendedCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationExtendedCard(location: location2)
            .previewLayout(.sizeThatFits)
    }
}

