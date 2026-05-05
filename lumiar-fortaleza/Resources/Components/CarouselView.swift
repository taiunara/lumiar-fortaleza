//
//  CarouselView.swift
//  lumiar-fortaleza
//
//  Created by user on 30/04/26.
//
import SwiftUI
import SwiftData

struct CarouselView: View {
    var location: Location
    
    @State private var currentIndex = 0
    
    var imagesNames: [String] {
        return [location.imageName]
    }
    
    var body: some View {
        VStack(spacing:0){
            TabView(selection:$currentIndex){
                ForEach(0..<imagesNames.count,id: \.self){ imageIndex in
                    Image(imagesNames[imageIndex])
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200) // Adjust the height as needed
                        .cornerRadius(30)   // Add rounded corners
                        .clipped()
                        .tag(imageIndex)                    
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
    }
}

//#Preview {
//    CarouselView(location: Location.)
//}
