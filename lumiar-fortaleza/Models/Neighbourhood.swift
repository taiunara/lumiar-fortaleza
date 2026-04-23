//
//  Neighbourhood.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation
import SwiftData

@Model
class Neighbourhood {
    var name        : String
    var locations   : [Location]?
    
    init(name: String, locations: [Location]) {
        self.name = name
        self.locations = nil
    }
}
