//
//  RoutesButton.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct RoutesButtonView: View {
    var radius: CGFloat
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Button(action: {
            openURL(URL(string: "https://maps.apple/r/SM-ydEP-2XIi02")!)
        }) {
            VStack(alignment: .center, spacing: 0) {
                Image(systemName: "arrow.trianglehead.turn.up.right.diamond.fill")
                    .foregroundColor(.white)
                Text("Rotas")
                    .font(.subheadline)
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            .frame(maxWidth: .infinity, alignment: .center)
            .frame(height: 52)
            .background(Color.blue)
            .cornerRadius(radius)
        }

    }
}

#Preview {
    RoutesButtonView(radius: 35)
}
