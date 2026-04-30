//
//  LocarionSheetView.swift
//  lumiar-fortaleza
//
//  Created by Tainara & Ulisses on 27/04/26.
//

import SwiftUI
import SwiftData

struct LocationSheetView: View {
    
    @State private var selectedDetent: PresentationDetent = .medium
    @State private var isSheetPresented = false
    
    var body: some View {
        Button("Show Sheet") {
            isSheetPresented.toggle()
        }
        .sheet(isPresented: $isSheetPresented) {
            sheetContent
                .presentationDetents([ .medium, .large], selection: $selectedDetent)
        }
    }
    
    @ViewBuilder
    private var sheetContent: some View {
        switch selectedDetent {
        case .medium:
            LocationContentSheetView()
        case .large:
            LocationContentSheetView()
        default:
            LocationContentSheetView()
        }
        
    }
    
    
}

#Preview {
    LocationSheetView()
}
