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
                .frame(width: 300, height: 300)
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
            Button("Predict") {
                guard let uiImage = UIImage(named: images[currentIndex]) else { return }
            // resize the image
                let resizedImage = uiImage.resize(to: CGSize(width: 224, height: 224))
                
            }.buttonStyle(.borderedProminent)
            
            List(1...10, id: \.self) { text in
                Text("Prediction \(index)")
            }
        }
        .padding()
    }
}

#Preview {
    RandomImageView()
}
