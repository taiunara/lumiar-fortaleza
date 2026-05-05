//
//  NeighbourhoodListView.swift
//  lumiar-fortaleza
//
//  Created by User on 23/04/26.
//

import SwiftUI
import SwiftData

struct NeighbourhoodListView: View {
    
    @Query private var locations: [Location]
    var bairros: [String] {
        let todosBairros = locations.map { $0.neighbourhood }
        let bairrosUnicos = Set(todosBairros)
        return Array(bairrosUnicos).sorted()
    }
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alphabet, id:\.self) { letter in
                    
                    // 3. Filtra os bairros que COMEÇAM com a letra atual do loop
                    let bairrosComLetra = bairros.filter { $0.hasPrefix(letter) }
                    
                    // 4. Só desenha a seção na tela se existir algum bairro com essa letra
                    if !bairrosComLetra.isEmpty {
                        Section {
                            ForEach(bairrosComLetra, id: \.self) { bairro in
                                // Futuramente você pode passar a variável 'bairro' para a tela seguinte
                                NavigationLink(destination: NeighbourhoodExtendedView(neighborhood: bairro)) {
                                    Text(bairro)
                                }
                            }
                        } header: {
                            Text(letter)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Bairros")
//            .onAppear {
//                pontos = loadPoints() ?? []
//            }
        }
        
    }
    
}
    

#Preview {
    do {
        // 1. Cria um banco de dados temporário para o Preview
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Location.self, configurations: config)
        
        // 2. Faz o DataLoader ler o JSON real e jogar no Preview
        DataLoader.preloadData(context: container.mainContext)
        
        // 3. Mostra a tela de bairros conectada ao banco temporário
        return NeighbourhoodListView()
            .modelContainer(container)
            
    } catch {
        return Text("Erro no Preview: \(error.localizedDescription)")
    }
}
