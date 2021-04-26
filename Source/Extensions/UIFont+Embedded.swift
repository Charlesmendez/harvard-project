//
//  UIFont+Embedded.swift
//  Created on 1/18/21
//

import UIKit

extension UIFont {
    static func dmSans(size: CGFloat, weight: DMSansWeight = .regular) -> UIFont {
        guard let font = UIFont(name: weight.name, size: size) else {
            fatalError("Missing font: \(weight.name)")
        }
        return font
    }
}

enum DMSansWeight: String {
    case regular = "Regular"
    case italic = "Italic"
    case medium = "medium"
    case mediumItalic = "MediumItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"

    fileprivate var name: String {
        "DMSans-\(rawValue)"
    }
}
