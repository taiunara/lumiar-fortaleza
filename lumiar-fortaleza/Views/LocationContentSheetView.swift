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
                    Image(.imageTest1)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .clipped()
                    Image(.imageTest2)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .clipped()
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
                
            }
            .padding(.horizontal, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text(location1.name).foregroundStyle(Color.black)
                        Text(location1.category.rawValue).foregroundStyle(Color.gray)
                    }
                }
            }
            
            Spacer()
        }
        
    }
    
}

#Preview {
    LocationContentSheetView()
}
