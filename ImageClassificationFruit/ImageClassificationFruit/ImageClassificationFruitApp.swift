//
//  ImageClassificationFruitApp.swift
//  ImageClassificationFruit
//
//  Created by don't touch me on 1/29/24.
//

import SwiftUI

struct ImageClassificationFruitApp: View {
    
    let photos = ["banana","tiger","bottle"]
    @State private var currentIndex: Int = 0
    @State private var classificationLabel: String = ""
    
    let model = MobileNetV2()
    
    private func performImageClassification() {
        
        let currentImageName = photos[currentIndex]
        
        guard let img = UIImage(named: currentImageName),
            let resizedImage = img.resizeTo(size: CGSize(width: 224, height: 224)),
            let buffer = resizedImage.toBuffer() else {
                return
        }
        
        let output = try? model.prediction(image: buffer)
        
        if let output = output {
            
            //self.classificationLabel = output.classLabel
            let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
            
            let result = results.map { (key, value) in
                return "\(key) = \(value * 100)%"
            }.joined(separator: "\n")
            
            classificationLabel = result
            
        }
        
        
    }
    
    var body: some View {
        VStack {
            Image(photos[currentIndex])
            .resizable()
                .frame(width: 200, height: 200)
            HStack {
                Button("Previous") {
                    
                    if self.currentIndex >= self.photos.count {
                        self.currentIndex = self.currentIndex - 1
                    } else {
                        self.currentIndex = 0
                    }
                    
                    }.padding()
                    .foregroundColor(Color.white)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .frame(width: 100)
                
                Button("Next") {
                    if self.currentIndex < self.photos.count - 1 {
                        self.currentIndex = self.currentIndex + 1
                    } else {
                        self.currentIndex = 0
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .frame(width: 100)
                .background(Color.gray)
                .cornerRadius(10)
            
                
                
            }.padding()
            
            Button("Classify") {
                // classify the image here
                self.performImageClassification()
                
            }.padding()
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(8)
            
            Text(classificationLabel)
                .font(.largeTitle)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageClassificationFruitApp()
    }
}
