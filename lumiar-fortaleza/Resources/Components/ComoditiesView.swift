//
//  ComoditiesView.swift
//  lumiar-fortaleza
//
//  Created by User on 28/04/26.
//

//
//  RoutesButton.swift
//  lumiar-fortaleza
//
//  Created by User on 27/04/26.
//

import SwiftUI

struct ComoditiesView: View {
    
    @State var comodities: [Comodities] = Comodities.allCases

    var body: some View {
        
        VStack (alignment: .leading, spacing: 5) {
            Text("Comodidades").font(.title).fontWeight(.medium)
            VStack(alignment: .leading, spacing: 5)  {
                ForEach(comodities
                ){ comodities in
                    Label {
                        Text(comodities.rawValue)
                    } icon: {
                        comodities.imageName
                    }.labelIconToTitleSpacing(10)
                }
            }.foregroundColor(.gray)
        }
       

    }
}

#Preview {
    LocationContentSheetView()
}

