//
//  ProbabilityListView.swift
//  RandomImageClassification
//
//  Created by Jason Sanchez on 5/20/24.
//

import SwiftUI

struct ProbabilityListView: View {
    let probs: [Dictionary<String, Double>.Element]
    
    var body: some View {
        List(probs, id: \.key) { (key, value) in
            HStack {
                Text(key)
                Text("\(value)")
            }
        }
    }
}


#Preview {
    ProbabilityListView(probs: [])
}

