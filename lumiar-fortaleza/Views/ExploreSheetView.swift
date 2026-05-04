//
//  ExploreContentSheetView.swift
//  lumiar-fortaleza
//
//  Created by Marcelo & Ulisses on 29/04/26.
//

import Foundation
import SwiftData
import SwiftUI

struct ExploreContentSheetView: View {
    
    @State private var isExpanded: Bool = false
    
    @Query private var locations: [Location]
    
    var body: some View {
        
        NavigationStack {
            List {
                
                
                if let sugestion = locations.randomElement() {
                    
                    Section("Sugestão do dia") {
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundStyle(sugestion.category.iconColor)
                                    .frame(width: 40, height: 40)
                                
                                Image(systemName: sugestion.category.iconSymbol)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                            }
                            
                            NavigationLink(destination: LocationView(location: sugestion)) {
                                VStack {
                                    HStack {
                                        Text(sugestion.name)
                                        Spacer()
                                    }
                                    HStack {
                                        Label {
                                            Text("1.5km") // No futuro, você pode calcular a distância real aqui
                                                .foregroundStyle(.gray)
                                        } icon: {
                                            Image(systemName: "location.fill")
                                                .foregroundStyle(.gray)
                                        }
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                } else {
                    // Caso o banco de dados ainda esteja carregando
                    Text("Carregando sugestões...")
                        .foregroundStyle(.gray)
                }
                
//                Section("Próximos a você") {
//                    
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location1.category.iconColor)
//                            Image(systemName: location1.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)
//                    
//                    
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location2.category.iconColor)
//                            Image(systemName: location2.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)
//                    
//                    
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location1.category.iconColor)
//                            Image(systemName: location2.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)
//                    
//                    
//                }
//                
//                Section("Recentes") {
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location2.category.iconColor)
//                            Image(systemName: location1.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)
//                    
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location1.category.iconColor)
//                            Image(systemName: location2.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)
//                    
//                    HStack{
//                        ZStack{
//                            Circle()
//                                .foregroundStyle(location2.category.iconColor)
//                            Image(systemName: location2.category.iconSymbol)
//                                .font(.headline)
//                                .foregroundStyle(.white)
//                        }
//                        
//                        NavigationLink(destination: LocationView()) {
//                            VStack{
//                                HStack{
//                                    Text(location1.name)
//                                    Spacer()
//                                }
//                                HStack{
//                                    Label {
//                                        Text("1.5km")
//                                            .foregroundStyle(.gray)
//                                    } icon: {
//                                        Image(systemName: "location.fill")
//                                            .font(.caption)
//                                            .foregroundStyle(.gray)
//                                    }.labelIconToTitleSpacing(0)
//                                    
//                                    Spacer()
//                                }
//                            }
//                            
//                        }
//                    }
//                    .frame(height: 40)}
                
            }
        }
    }
}

#Preview {
    ExploreContentSheetView()
}
