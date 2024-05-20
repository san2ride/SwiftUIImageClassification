//
//  UIImage+Ext.swift
//  RandomImageClassification
//
//  Created by Jason Sanchez on 5/20/24.
//

import UIKit

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
