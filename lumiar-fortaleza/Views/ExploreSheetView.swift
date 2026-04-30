//
//  ExploreContentSheetView.swift
//  lumiar-fortaleza
//
//  Created by Marcelo & Ulisses on 29/04/26.
//

import Foundation
import SwiftUI

struct ExploreContentSheetView: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Sugestão do dia") {
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location2.category.iconColor)
                            Image(systemName: location1.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    
                }
                
                Section("Próximos a você") {
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location1.category.iconColor)
                            Image(systemName: location1.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location2.category.iconColor)
                            Image(systemName: location2.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location1.category.iconColor)
                            Image(systemName: location2.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    
                }
                
                Section("Recentes") {
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location2.category.iconColor)
                            Image(systemName: location1.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location1.category.iconColor)
                            Image(systemName: location2.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)
                    
                    HStack{
                        ZStack{
                            Circle()
                                .foregroundStyle(location2.category.iconColor)
                            Image(systemName: location2.category.iconSymbol)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        
                        NavigationLink(destination: LocationView()) {
                            VStack{
                                HStack{
                                    Text(location1.name)
                                    Spacer()
                                }
                                HStack{
                                    Label {
                                        Text("1.5km")
                                            .foregroundStyle(.gray)
                                    } icon: {
                                        Image(systemName: "location.fill")
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }.labelIconToTitleSpacing(0)
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .frame(height: 40)}
                
            }
        }
    }
}

#Preview {
    ExploreContentSheetView()
}
