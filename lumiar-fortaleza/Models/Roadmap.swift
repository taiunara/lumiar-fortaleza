//
//  Roadmap.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//
import Foundation
import SwiftData

@Model
class Roadmap {
    var name                : String
    var locations           : [Location]
    var estimatedTimeMin    : Int
    var estimatedTimeHour   : Int
    var estimatedDistance   : Float
    
    init(name: String, locations: [Location], estimatedTimeMin: Int, estimatedTimeHour: Int, estimatedDistance: Float) {
        self.name = name
        self.locations = locations
        self.estimatedTimeMin = estimatedTimeMin
        self.estimatedTimeHour = estimatedTimeHour
        self.estimatedDistance = estimatedDistance
    }
}
