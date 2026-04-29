//
//  NeighbourhoodListView.swift
//  lumiar-fortaleza
//
//  Created by User on 23/04/26.
//

import SwiftUI

struct IndexedSections: View {
    
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
                    
                    Section {
                        ForEach(bairros, id: \.self) { bairro in
                            if bairro.first == letter.first {
                                Text(bairro)
                            }
                        }
                        
                    } header: {
                        Text(letter)
      
                    }
                }
                .padding()
            }
            .onAppear {
                pontos = loadPoints() ?? []
            }
        }
        
    }
    
}
    
    
    
    // Nossa view
    //struct NeighbourhoodListView: View {
    //
    //    @State var neighbourhoods: [Neighbourhood]
    //
    //    var body: some View {
    //        NavigationStack {
    //            List {
    //                ForEach(neighbourhoods) { neighbourhood in
    //                    Text(neighbourhood.name)
    //                }
    //            }
    //        }
    //    }
    //}
    //func
    //
    #Preview {
        IndexedSections()
    }
