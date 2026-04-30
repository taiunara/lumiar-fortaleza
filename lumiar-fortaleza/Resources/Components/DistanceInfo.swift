//
//  RoutesButton.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct DistanceInfoView: View {

    var body: some View {
        VStack{
            Text("Distância")
            Label {
                Text("1.5km")
            } icon: {
                Image(systemName: "point.topleft.down.to.point.bottomright.curvepath.fill")
            }
            
        }
        .padding(5)
        .frame(maxWidth: .infinity, alignment: .center)
        .cornerRadius(10)

    }
}

