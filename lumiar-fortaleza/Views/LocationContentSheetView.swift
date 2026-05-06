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
                    CarouselView(location: location)
                    
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

            Spacer()
        }
    }
}


#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Location.self, configurations: config)
        
        DataLoader.preloadData(context: container.mainContext)
        
        let fetchDescriptor = FetchDescriptor<Location>()
        let locaisSalvos = try container.mainContext.fetch(fetchDescriptor)
        
        guard let primeiroLocalDoJson = locaisSalvos.first else {
            return AnyView(Text("Nenhum local encontrado no JSON.")) // AnyView resolve conflito de tipo no preview
        }
        
        return AnyView(
            LocationContentSheetView(location: primeiroLocalDoJson)
                .modelContainer(container)
        )
        
    } catch {
        return AnyView(Text("Erro no Preview: \(error.localizedDescription)"))
    }
}
