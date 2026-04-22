//
//  Location.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation

struct Location: Identifiable {
    let id              = UUID()
    let name            : String
    let Title           : String
    let Address         : String
    let Description     : String
    let Category        : LocationType
    let Neighbourhood   : Neighbourhood
}
