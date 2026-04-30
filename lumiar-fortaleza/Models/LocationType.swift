//
//  LocationType.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation
import SwiftUI

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
    
    var iconSymbol: String {
        switch self {
        case .none:
            return "mappin"
        case .park:
            return "leaf.fill"
        case .museum:
            return "building.columns.fill"
        case .cinema:
            return "popcorn.fill"
        case .theater:
            return "theatermasks.fill"
        case .historicalLandmark:
            return "pyramid.fill"
        case .touristAttraction:
            return "camera.fill"
        case .religiousLandmark:
            return "bird.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .none:
            return .figmaBackground
        case .park:
            return .defaultGreen
        case .museum:
            return .darkOrange
        case .cinema:
            return .lightOrange
        case .theater:
            return .defaultYellow
        case .historicalLandmark:
            return .intensePink
        case .touristAttraction:
            return .darkBlue
        case .religiousLandmark:
            return .mintBlue
        }
    }
}
