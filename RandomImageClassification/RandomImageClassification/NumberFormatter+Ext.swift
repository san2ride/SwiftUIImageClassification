//
//  NumberFormatter+Ext.swift
//  RandomImageClassification
//
//  Created by Jason Sanchez on 5/20/24.
//

import Foundation

extension NumberFormatter {
    static var percentage: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter
    }
}
