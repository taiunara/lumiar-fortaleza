//
//  UsefulInformation.swift
//  lumiar-fortaleza
//
//  Created by User on 28/04/26.
//

import SwiftUI

struct UsefulInformation: View {
    
    @State private var presentingWorkingHours = false

    //TODO: Adicionar posteriomente horário recomendado E linkar os horarios e dias da semana a API
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text("Informacoes úteis").font(.title).fontWeight(.medium)
        
            HStack{
                Label {
                    Text("Horário de Funcionamento")
                } icon: {
                    Image(systemName: "clock.fill")
                }
                
                Spacer()
                if (presentingWorkingHours) {
                    Image(systemName: "chevron.up")
                } else {
                    Image(systemName: "chevron.down")
                }
            }
            .onTapGesture {
                presentingWorkingHours.toggle()
            }
            
            if (presentingWorkingHours) {
                VStack {
                    HStack{
                        Text("Domingo")
                        Spacer()
                        Text("16:00 - 18:00")
                    }.foregroundStyle(.gray)
                }
            }
            
        
            
        }.padding(.vertical, 5)
        
    }
}

#Preview {
    LocationContentSheetView()
}

