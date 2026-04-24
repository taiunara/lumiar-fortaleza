//
//  LocationView.swift
//  lumiar-fortaleza
//
//  Created by user on 24/04/26.
//

import SwiftUI

struct NeighbourhoodExtendedView: View {
    
  
    var body: some View {
        let neighbourhood = Neighbourhood(name: "Serviluz", locations: [])
        
        let location = Location(
            name: "Farol do Mucuripe",
            title: "Um farol que não guia mais navios, mas ainda ilumina histórias",
            address: "R. Amancio Filomeno - Cais do Porto, Fortaleza - CE, 60180-320",
            history: "Antes dos prédios, antes da cidade crescer… já era ele que dominava a paisagem.  Construído no século XIX, o Farol do Mucuripe ajudava embarcações a chegar com segurança à costa de Fortaleza. Sua luz alcançava quilômetros no mar e marcou o início de um período importante de crescimento da cidade.  Mas o que muita gente não sabe é que esse lugar vai muito além da função de navegação.  Com o passar dos anos, o farol foi desativado, abandonado e quase esquecido. Sua estrutura chegou a correr risco de desabar e por pouco, Fortaleza não perdeu um dos seus símbolos mais antigos.  Foi então que algo mudou: a comunidade ao redor decidiu agir.  Moradores do Serviluz se mobilizaram, cobraram, lutaram… e conseguiram salvar o farol. Hoje, ele é um símbolo de resistência e pertencimento Curiosidade: Debaixo do farol, arqueólogos encontraram vestígios de um antigo forte militar, O Fortim de São Luís, revelando que o local já era estratégico muito antes da construção atual",
            category: LocationType.historicalLandmark,
//            neighbourhood: neighbourhood,
            visitTimeMin: 40,
            visitTimeHour: 0
        )
        
        @Environment(\.dismiss) var dismiss
        
        VStack (alignment: .center, spacing: 10) {
            VStack{
                    Image(.imageTest2)
                        .resizable()
                        .scaledToFit()
                        //.cornerRadius(15)
                        .clipped()
            }
            
            VStack (alignment: .leading, spacing: 10) {
                Text(location.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(location.title)
            }
            .padding(.bottom, 25)
            .padding(.top, 5)
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .background(Color(red: 0.96, green: 0.96, blue: 0.96).opacity(1))
        .background(Color(red: 0.15, green: 0.15, blue: 0.15))
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
        
    }
}

#Preview {
    NeighbourhoodExtendedView()
}
