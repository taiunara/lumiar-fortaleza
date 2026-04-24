//
//  Location.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//

import Foundation
import SwiftData

@Model
class Location {
    var name            : String
    var title           : String
    var address         : String
    var history         : String
    var category        : LocationType
    var neighbourhood   : Neighbourhood
    var visitTimeMin    : Int
    var visitTimeHour   : Int
    
    init(name: String, title: String, address: String, history: String, category: LocationType, neighbourhood: Neighbourhood, visitTimeMin: Int, visitTimeHour: Int) {
        self.name = name
        self.title = title
        self.address = address
        self.history = history
        self.category = category
        self.neighbourhood = neighbourhood
        self.visitTimeMin = visitTimeMin
        self.visitTimeHour = visitTimeHour
    }
}
