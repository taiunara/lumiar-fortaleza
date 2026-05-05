//
//  OpeningHour.swift
//  lumiar-fortaleza
//
//  Created by user on 28/04/26.
//

// Struct que recebe os dados do Json

import SwiftUI
import Foundation


struct Point: Codable {
    let Bairro: String
    let name: String
    let address: String
    let category: String
    let description: String
    let hour: [OpeningHoursDTO]
    let amenities: String?
    let locationLink: String?
    let imageIds: String?
    let imageDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case Bairro, name, address, category
        case description
        case hour
        case amenities = "Comodidades"
        case locationLink = "Link Localização"
        case imageIds = "Foto do Lugar"
        case imageDescription = "Descrição da Imagem"
    }
}


struct WorkingHours: Codable {
    let weekday: String
    let openingHour: String
    let closingHour: String
}


struct OpeningHoursDTO: Codable {
    let monday: String
    let tuesday: String
    let wednesday: String
    let thursday: String
    let friday: String
    let saturday: String
    let sunday: String

    enum CodingKeys: String, CodingKey {
        case monday = "segunda"
        case tuesday = "terca"
        case wednesday = "quarta"
        case thursday = "quinta"
        case friday = "sexta"
        case saturday = "sabado"
        case sunday = "domingo"
    }
}
