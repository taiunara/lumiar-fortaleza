//
//  CarouselView.swift
//  lumiar-fortaleza
//
//  Created by user on 30/04/26.
//
import SwiftUI

struct CarouselView: View {
    let imagesNames: [String] = ["ImageTest1", "ImageTest2", "ImageTest3", "ImageTest4", "ImageTest5"]
    @State private var currentIndex = 0
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

#Preview {
    CarouselView()
}
