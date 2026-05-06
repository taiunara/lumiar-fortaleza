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
    
    @Binding var searchText: String
    
    @Binding var isSearching: Bool
    
    var sugestion: Location? {
        locations.randomElement()
    }
    
    var locationList: [Location] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter { location in
                location.name.localizedStandardContains(searchText) ||
                location.category.displayName.localizedStandardContains(searchText) ||
                location.neighbourhood.localizedStandardContains(searchText)
            }
        }
    }
    
    func createLocationCard(for location: Location) -> some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundStyle(location.category.iconColor)
                    .frame(width: 40, height: 40)
                
                Image(systemName: location.category.iconSymbol)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                
            }
            
            
            NavigationLink(destination: LocationContentSheetView(location: location)) {
                VStack {
                    HStack {
                        Text(location.name)
                        Spacer()
                    }
                    HStack {
                        Label {
                            // TODO: No futuro, você pode calcular a distância real aqui
                            Text(location.neighbourhood)
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
    
    var dailySuggestion: some View {
        Section("Sugestão do dia") {
            createLocationCard(for: sugestion!)
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                if isSearching {
                    ForEach(locationList) { location in
                        createLocationCard(for: location)
                    }
                } else {
                    if let sugestion {
                        dailySuggestion
                    } else {
                        // Caso o banco de dados ainda esteja carregando
                        Text("Carregando sugestões...")
                            .foregroundStyle(.gray)
                    }
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
    @Previewable @State var searchText: String = ""
    @Previewable @State var isSearching: Bool = false
    
    ExploreContentSheetView(searchText: $searchText, isSearching: $isSearching)
}
