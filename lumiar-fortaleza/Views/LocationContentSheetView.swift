//
//  LocationContentSheet.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import Foundation
import SwiftUI

struct LocationContentSheetView: View {
    
    @State private var isExpanded: Bool = false
    @State var points = [Point]()
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                
                RoutesButtonView(radius: 30)
                
                HStack{
                    VStack{
                        Text("Funcionamento")
                        
                        Text("Aberto")
                            .foregroundStyle(.green)
                            .bold()
                    }
                    .padding(5)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .cornerRadius(10)
                    
                    DistanceInfoView()
                    
                }
                
                HStack(alignment: .center, spacing: 10){
                    CarouselView()

                }
                .frame(maxHeight: 150, alignment: .leading)
                .cornerRadius(15)
                
                VStack (alignment: .leading, spacing: 5) {
                    Text(location1.history)
                        .lineLimit(isExpanded ? nil : 5)
                    
                    Button(action: {
                        isExpanded = true
                    }) {
                        Text("Ler mais")
                    }
                }
                .navigationDestination(isPresented: $isExpanded) {
                    LocationView()
                }
                
//  View de informações úteis
                
                UsefulInformation()
                
                ComoditiesView()

                
            }
            .padding(.horizontal, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text(location1.name).foregroundStyle(Color.black)
                        Text(location1.category.rawValue).foregroundStyle(Color.gray)
                    }
                }
            }
            .onAppear {
                points = loadPoints() ?? []
            }
            
            //Componente Comodidades
            Spacer()
        }
        
    }
    
}



// Função para acessar o Json
func loadPoints() -> [Point]? {
    guard let url = Bundle.main.url(forResource: "Points", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        print("Erro ao carregar arquivo JSON")
        return nil
    }
    
    do {
        let pontos = try JSONDecoder().decode([Point].self, from: data)
        return pontos
    } catch {
        print("Erro ao decodificar JSON: \(error)")
        return nil
    }
}


#Preview {
    LocationContentSheetView()
}
