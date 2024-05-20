//
//  RandomImageView.swift
//  RandomImageClassification
//
//  Created by Jason Sanchez on 5/17/24.
//

import SwiftUI

struct RandomImageView: View {
    
    let images = ["1", "2", "3", "4"]
    @State private var currentIndex =  0
    
    var body: some View {
        VStack {
            Image(images[currentIndex])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 225, height: 225)
            HStack {
                Button("Previous") {
                    currentIndex -= 1
                }.buttonStyle(.bordered)
                    .disabled(currentIndex == 0)
                
                Button("Next") {
                    currentIndex += 1
                }.buttonStyle(.bordered)
                    .disabled(currentIndex == images.count - 1)
            }
        }
        .padding()
    }
}

#Preview {
    RandomImageView()
}
