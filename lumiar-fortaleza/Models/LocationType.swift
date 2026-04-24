//
//  LocationType.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation

enum LocationType: String, CaseIterable, Codable {
    case none = "Nenhum"
    case park = "Parque"
    case museum = "Museu"
    case cinema = "Cinema"
    case theater = "Teatro"
    // case naturalLandmark = "Marco Natural"
    case historicalLandmark = "Marco Histórico"
    case touristAttraction = "Atração Turística"
    case religiousLandmark = "Monumento Religioso"
    
}
