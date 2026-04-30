//
//  NeighbourhoodListView.swift
//  lumiar-fortaleza
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct NeighbourhoodListView: View {
    
    @State private var pontos: [Point] = []
    
    var bairros: [String] {
        //nao repetir os bairros
        pontos.flatMap(\.Bairro).sorted()
    }
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(alphabet, id:\.self) { letter in
                    //verificar primeiro se tem algum bairro com essa letra, se nao pula
                    let list = bairros.filter({ $0.first == letter.first })
                    let listSet = Set(list)
                    
                    if (!listSet.isEmpty) {
                        Section {
                            ForEach(Array(listSet), id: \.self) { bairro in
                                NavigationLink(destination: NeighbourhoodExtendedView()) {
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
            .onAppear {
                pontos = loadPoints() ?? []
            }
        }
        
    }
    
}
    

    #Preview {
        NeighbourhoodListView()
    }
