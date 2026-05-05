//
//  Comodities.swift
//  lumiar-fortaleza
//
//  Created by User on 28/04/26.
//
import SwiftUI
import Foundation

enum Comodities: String, CaseIterable, Codable, Identifiable {
    case none = "none"
    case bathroom = "bathroom"
    case park = "park"
    case acessibility = "acessibility"
    
    // Propriedade para mostrar na tela (UI)
    var displayName: String {
        switch self {
        case .none:
                return "Nenhum"
            case .bathroom:
                return "Banheiro"
            case .park:
                return "Estacionamento"
            case .acessibility:
                return "Acessibilidade"
        }
    }
    
    var imageName: Image {
        switch self {
        case .none:
            return Image(systemName: "nosign")
            case .bathroom:
                return Image(systemName: "toilet.circle.fill")
            case .park:
                return Image(systemName: "car.circle.fill")
            case .acessibility:
                return Image(systemName: "figure.roll.circle.fill")
        }
    }
    
    var id: Self { self }}
