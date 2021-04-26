//
//  NSAttributedString+Modifiers.swift
//  Created on 1/18/21
//

import UIKit

extension NSAttributedString {
    func with(fontSize: CGFloat) -> NSAttributedString {
        let mutable: NSMutableAttributedString = criticalCast(self.mutableCopy())
        enumerateAttributes(in: NSRange(0..<string.count), options: []) { attributes, range, _ in
            var newAttributes = [NSAttributedString.Key: Any]()
            newAttributes = attributes
            if let font = attributes[.font] as? UIFont {
                newAttributes[.font] = UIFont(name: font.fontName, size: fontSize)
            } else {
                newAttributes[.font] = UIFont.dmSans(size: fontSize)
            }
            mutable.setAttributes(newAttributes, range: range)
        }
        return mutable
    }
}
