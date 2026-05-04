//
//  DataLoader.swift
//  lumiar-fortaleza
//
//  Created by user on 04/05/26.
//

import Foundation
import SwiftData
import MapKit

@MainActor
class DataLoader {
    // Função para acessar o Json
//    func loadPoints() -> [Point]? {
//        guard let url = Bundle.main.url(forResource: "Points", withExtension: "json"),
//              let data = try? Data(contentsOf: url) else {
//            print("Erro ao carregar arquivo JSON")
//            return nil
//        }
//        
//        do {
//            let pontos = try JSONDecoder().decode([Point].self, from: data)
//            return pontos
//        } catch {
//            print("Erro ao decodificar JSON: \(error)")
//            return nil
//        }
//    }
    
    
    static func preloadData(context: ModelContext) {
        // Verificação de duplicados
        let fetchDescriptor = FetchDescriptor<Location>()
        let existingLocations = (try? context.fetch(fetchDescriptor)) ?? []
        
        if existingLocations.isEmpty {
            loadFromJSON(context: context)
        }
    }
    
    static func preloadDataV2() -> [Location] {
        let newLocations = loadFromJSON()
        return newLocations
    }
    
    private static func loadFromJSON() -> [Location] {
        guard let url = Bundle.main.url(forResource: "Points", withExtension: "json")
        else {
            print("Erro: Points.json não encontrado.")
            return []
        }
        var result: [Location] = []
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedLocations = try decoder.decode( [LocationDTO].self, from: data)
            
            for dto in decodedLocations {
                let mappedCategory = LocationType(rawValue: dto.category) ?? .none
                let mappedComodities = dto.comodities.compactMap { Comodities(rawValue: $0) }
                
                let newLocation = Location(
                    name: dto.name,
                    title: dto.name,
                    address: dto.address,
                    history: dto.history,
                    category: mappedCategory,
                    neighbourhood: dto.neighbourhood,
                    coordinates: CLLocationCoordinate2D(latitude: dto.latitude, longitude: dto.longitude),
                    comodities: mappedComodities
                )
                
                result.append(newLocation)
            }
            
            print("Sucesso: \(decodedLocations.count) locais salvos no SwiftData.")
        } catch {
            print("Erro ao decodificar JSON: \(error)")
        }
        
        return result
    }
    
    private static func loadFromJSON(context: ModelContext) {
        guard let url = Bundle.main.url(forResource: "Points", withExtension: "json")
        else {
            print("Erro: Points.json não encontrado.")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedLocations = try decoder.decode( [LocationDTO].self, from: data)
            
            for dto in decodedLocations {
                let mappedCategory = LocationType(rawValue: dto.category) ?? .none
                let mappedComodities = dto.comodities.compactMap { Comodities(rawValue: $0) }
                
                let newLocation = Location(
                    name: dto.name,
                    title: dto.name,
                    address: dto.address,
                    history: dto.history,
                    category: mappedCategory,
                    neighbourhood: dto.neighbourhood,
                    coordinates: CLLocationCoordinate2D(latitude: dto.latitude, longitude: dto.longitude),
                    comodities: mappedComodities
                )
                
                context.insert(newLocation)
            }
            
            try context.save()
            print("Sucesso: \(decodedLocations.count) locais salvos no SwiftData.")
        } catch {
            print("Erro ao decodificar JSON: \(error)")
        }
    }
    
}
