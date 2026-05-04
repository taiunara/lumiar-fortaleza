//
//  LocationContentSheet.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import Foundation
import SwiftUI
import SwiftData

struct LocationContentSheetView: View {
    @State private var isExpanded: Bool = false
//    @State var points = [Point]()
    
    var location: Location
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                
                HStack{
                    RoutesButtonView(radius: 30)
                }
                
                HStack{
                    VStack{ //TO DO:  Puxar o horário de funcionamento do database
                        Text("Funcionamento")
                        
                        Text("Aberto")
                            .foregroundStyle(.green)
                            .bold()
                    }
                    .padding(5)
                    
                    .frame( maxWidth: .infinity, alignment: .center)
                    .cornerRadius(10)
                    
                    DistanceInfoView()
                    
                }
                
                HStack(alignment: .center, spacing: 10){
                    CarouselView()
                    
                }
                .frame( minHeight: 150, maxHeight: 150 , alignment: .leading)
                .cornerRadius(15)
                
                VStack (alignment: .leading, spacing: 5) {
                    
                    Text(location.history)
                        .lineLimit(isExpanded ? nil : 5)
                        .frame(width: .infinity, height: 100)
                    
                    Button(action: {
                        isExpanded = true
                    }) {
                        Text("Ler mais")
                    }
                    
                    .navigationDestination(isPresented: $isExpanded) {
                        LocationView(location: location)
                    }
                    
                }
//  View de informações úteis
                
                UsefulInformation(location: location)
                
                ComoditiesView()

                
            }
            .frame(width: .infinity, height: 300,  alignment: .topLeading)
            .padding(.horizontal, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text(location.name).foregroundStyle(Color.black)
                        Text(location.category.displayName).foregroundStyle(Color.gray)
                    }
                    
                }
            }
//            .onAppear {
//                points = loadPoints() ?? []
//                location = preloadData() 
//            }
            
            //Componente Comodidades
            Spacer()
        }
    }
}

 //Função para acessar o Json
//func loadPoints() -> [Point]? {
//    guard let url = Bundle.main.url(forResource: "Points", withExtension: "json"),
//          let data = try? Data(contentsOf: url) else {
//        print("Erro ao carregar arquivo JSON")
//        return nil
//    }
//    
//    do {
//        let pontos = try JSONDecoder().decode([Point].self, from: data)
//        return pontos
//    } catch {
//        print("Erro ao decodificar JSON: \(error)")
//        return nil
//    }
//}

//func encontrarLocal(pelo id: UUID) {
//    let localDesejado = locations.first(where: { $0.id == id })
//    // faz algo com o localDesejado
//}


#Preview {
    do {
        // 1. Cria um banco de dados temporário para o Preview
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Location.self, configurations: config)
        
        // 2. Mandamos o DataLoader ler o JSON real e injetar nesse banco temporário
        DataLoader.preloadData(context: container.mainContext)
        
        // 3. Agora buscamos o primeiro local que o DataLoader acabou de salvar
        let fetchDescriptor = FetchDescriptor<Location>()
        let locaisSalvos = try container.mainContext.fetch(fetchDescriptor)
        
        // 4. Pegamos o primeiro local da lista
        guard let primeiroLocalDoJson = locaisSalvos.first else {
            return AnyView(Text("Nenhum local encontrado no JSON.")) // AnyView resolve conflito de tipo no preview
        }
        
        // 5. Desenhamos a sua tela passando os dados reais que vieram do JSON!
        return AnyView(
            LocationContentSheetView(location: primeiroLocalDoJson)
                .modelContainer(container)
        )
        
    } catch {
        return AnyView(Text("Erro no Preview: \(error.localizedDescription)"))
    }
}
