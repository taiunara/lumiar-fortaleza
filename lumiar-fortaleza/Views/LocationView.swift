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
        @Environment(\.openURL) var openURL
       
        NavigationStack {
            ScrollView{
                VStack(alignment: .center , spacing: 15) {
                    
                    // Carrosel de fotos
                    HStack(alignment: .center, spacing: 10){
                        Image(.imageTest1)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                            .clipped()
                    }
                    .frame(maxHeight: .infinity, alignment: .leading)
                    .cornerRadius(15)
                    .navigationTitle(location1.name)
                    
                    VStack {
                        
                        // Botoes de rota e distância
                        HStack(alignment: .center, spacing: 10) {
                            Button(action: {
                                openURL(URL(string: "https://maps.app.goo.gl/HccYRS8MixnHh2sZ6")!)
                            }) {
                                VStack(alignment: .center, spacing: 0) {
                                    Image(systemName: "arrow.trianglehead.turn.up.right.diamond.fill")
                                        .foregroundColor(.white)
                                    Text("Rotas")
                                        .font(.subheadline)
                                        .foregroundStyle(.white)
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 5)
                                .frame(maxWidth: .infinity, minHeight: 53, maxHeight: 61, alignment: .center)
                                .background(Color.blue)
                                .cornerRadius(10)
                            }
                            
                            
                            VStack{
                                Text("Distância")
                                Label {
                                    Text("1.5km")
                                } icon: {
                                    Image(systemName: "point.topleft.down.to.point.bottomright.curvepath.fill")
                                }
                                
                            }
                            .padding(5)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .cornerRadius(10)
                            
                        }
                        .frame(maxWidth: .infinity, minHeight: 61, maxHeight: 61, alignment: .center)
                        
                    }
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
                    
                    // Titulo e texto
                    Text(location1.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(location1.history)
                    
                }
            }
            .padding(0)
            .safeAreaPadding(.horizontal, 20)
            
        }
    }
}


#Preview {
    LocationView()
}
