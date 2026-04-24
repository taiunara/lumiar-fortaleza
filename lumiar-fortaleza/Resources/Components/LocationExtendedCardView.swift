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
        
        VStack (alignment: .center, spacing: 10) {
            
            // Imagem do local
            Image(.imageTest1)
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .frame(minWidth: 574, maxWidth: 574 ,minHeight: 356, maxHeight: 376)
            
            
            // Nome e pequena descrição do local
            VStack (alignment: .leading, spacing: 10) {
                Text(location.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location.title)
                }
            .padding(.bottom, 20)
           
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(1))
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
        
    }
}

struct LocationExtendedCardView_Previews: PreviewProvider {
    static var previews: some View {
        LocationExtendedCardView(location: location1)
            .previewLayout(.sizeThatFits)
    }
}

