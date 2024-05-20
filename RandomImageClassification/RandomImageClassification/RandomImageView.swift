//
//  RandomImageView.swift
//  RandomImageClassification
//
//  Created by Jason Sanchez on 5/17/24.
//

import SwiftUI
import CoreML

struct RandomImageView: View {
    
    let images = ["1", "2", "3", "4"]
    @State private var currentIndex =  0
    @State private var probs: [String: Double] = [: ]
    
    let model = try! MobileNetV2(configuration: MLModelConfiguration())
    
    private var sortedProbs: [Dictionary<String, Double>.Element] {
        let probsArray = Array(probs)
        return probsArray.sorted { lhs, rhs in
            lhs.value > rhs.value
        }
    }
    
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
                guard let buffer = resizedImage.toCVPixelBuffer() else { return }
                
                do {
                    let prediction = try model.prediction(image: buffer)
                    probs = prediction.classLabelProbs
                    print(prediction.classLabel)
                } catch {
                    print(error.localizedDescription)
                }
            }.buttonStyle(.borderedProminent)
            
            ProbabilityListView(probs: sortedProbs)
        }
        .padding()
    }
}

#Preview {
    RandomImageView()
}
