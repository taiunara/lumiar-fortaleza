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
        
        let neighbourhood = Neighbourhood(name: "Serviluz", locations: [])
        
        let location = Location(
            name: "Farol do Mucuripe",
            title: "Um farol que não guia mais navios, mas ainda ilumina histórias",
            address: "R. Amancio Filomeno - Cais do Porto, Fortaleza - CE, 60180-320",
            history: "Antes dos prédios, antes da cidade crescer… já era ele que dominava a paisagem.  Construído no século XIX, o Farol do Mucuripe ajudava embarcações a chegar com segurança à costa de Fortaleza. Sua luz alcançava quilômetros no mar e marcou o início de um período importante de crescimento da cidade.  Mas o que muita gente não sabe é que esse lugar vai muito além da função de navegação.  Com o passar dos anos, o farol foi desativado, abandonado e quase esquecido. Sua estrutura chegou a correr risco de desabar e por pouco, Fortaleza não perdeu um dos seus símbolos mais antigos.  Foi então que algo mudou: a comunidade ao redor decidiu agir.  Moradores do Serviluz se mobilizaram, cobraram, lutaram… e conseguiram salvar o farol. Hoje, ele é um símbolo de resistência e pertencimento Curiosidade: Debaixo do farol, arqueólogos encontraram vestígios de um antigo forte militar, O Fortim de São Luís, revelando que o local já era estratégico muito antes da construção atual",
            category: LocationType.historicalLandmark,
            neighbourhood: neighbourhood,
            visitTimeMin: 40,
            visitTimeHour: 0
        )
        
        
        NavigationStack {
            HStack{
                Image(.imageTest)
                    .resizable()
                    .scaledToFit()

            }
            .navigationTitle(location.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    // TODO: Implementar função de retorno
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.backward")
                        }
                    }
                }
            }

            VStack {
                HStack {
                    Text(location.address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    if location.visitTimeHour == 0 {
                        Text("\(location.visitTimeMin)min")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    else{
                        Text("\(location.visitTimeHour)h \(location.visitTimeMin)min")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                
                Spacer()
                Text(location.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                    
                Spacer()
                Text(location.history)
            }
            .padding(20)
            
        }
    }
        
}

#Preview {
    LocationView()
}
