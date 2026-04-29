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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                        Image(systemName: "pencil.circle.fill").font(.title)
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
                
            }
        }
    }
}

#Preview {
    ExploreContentSheetView()
}
