//
//  OpeningHour.swift
//  lumiar-fortaleza
//
//  Created by user on 28/04/26.
//

// Struct que recebe os dados do Json

import SwiftUI
import Foundation


struct Point :Identifiable, Codable {
    let id: String
    let hour: String
    let bairro: String
    let name: String
    let address: String
    let category: String
    let description: String
//  let comodidades: String
//  let linkLocalizacao: String
//  let fotoDoLugar: String
//  let descricaoDaImagem: String
}
