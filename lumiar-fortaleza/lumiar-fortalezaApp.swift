//
//  lumiar_fortalezaApp.swift
//  lumiar-fortaleza
//
//  Created by User on 22/04/26.
//


import SwiftUI
import SwiftData

@main
struct LumiarFortalezaApp: App {
    var body: some Scene {
        WindowGroup {
            MapView()
        }
        .modelContainer(for: [Location.self])
    }
}
