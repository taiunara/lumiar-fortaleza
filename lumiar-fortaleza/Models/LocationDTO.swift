//
//  LocationDTO.swift
//  lumiar-fortaleza
//
//  Created by user on 04/05/26.
//

import Foundation

struct LocationDTO: Codable {
    let neighbourhood   : String
    let name            : String
    let address         : String
    let category        : String
    let subtitle        : String
    let history         : String
    let comodities      : [String]
    let locationLink    : String
    let imageName       : String
    let imageDescription: String
    let latitude        : Double
    let longitude       : Double
    let operatingHours  : OperatingHoursDTO
}

struct OperatingHoursDTO: Codable {
    let monday      : String
    let tuesday     : String
    let wednesday   : String
    let thursday    : String
    let friday      : String
    let saturday    : String
    let sunday      : String
}
