//
//  ExploreContentSheetView.swift
//  lumiar-fortaleza
//
//  Created by User on 29/04/26.
//

import Foundation
import SwiftUI

struct ExploreContentSheetView: View {
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        
        NavigationStack {
            List {
                Section("Sugestão do dia") {
                    HStack{
                        Image(systemName: "pencil.circle.fill")
                        NavigationLink(location2.name, destination: LocationView())
                    }
                }
                
                Section("Próximos a você") {
                    HStack{
                        Image(systemName: "pencil.circle.fill")
                        NavigationLink(location1.name, destination: LocationView())
                    }
                    
                    HStack{
                            Image(systemName: "pencil.circle.fill")
                            NavigationLink(location2.name, destination: LocationView())
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    ExploreContentSheetView()
}
