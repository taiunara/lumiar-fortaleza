//
//  Comodities.swift
//  lumiar-fortaleza
//
//  Created by User on 28/04/26.
//
import SwiftUI
import Foundation

enum Comodities: String, CaseIterable, Codable, Identifiable {
    case bathroom =  "Banheiro"
    case park = "Estacionamento"
    case acessibility = "Acessibilidade"
    
    var imageName: Image {
        switch(self) {
        case .bathroom:
            Image(systemName: "toilet.circle.fill")
            
        case .park:
            Image(systemName: "car.circle.fill")

        case .acessibility:
            Image(systemName: "figure.roll.circle.fill")

        }
    }
    
    var id: Self { self }
}
