//
//  String+Markdown.swift
//  Created on 1/18/21
//

import UIKit

extension String {
    /// Supports **bold** and *italics*
    var markdownAttributed: NSAttributedString {
        let string = NSMutableAttributedString()
        let scanner = Scanner(string: self)

        let tokenCharacters = CharacterSet(charactersIn: "*")
        while !scanner.isAtEnd {
            guard let priorToToken = scanner.scanUpToString("*") else {
                let remaining = String(scanner.string[scanner.currentIndex...])
                string.append(NSAttributedString(string: remaining))
                break
            }

            string.append(NSAttributedString(string: priorToToken))

            guard let tokens = scanner.scanCharacters(from: tokenCharacters) else {
                let remaining = String(scanner.string[scanner.currentIndex...])
                fatalError("Logic error, missing * token(s) in: \(remaining)")
            }

            var attribute: Attribute
            if tokens.count == 2 {
                attribute = .bold
            } else {
                attribute = .italics
            }

            if let attributed = scanner.scanUpToString(tokens) {
                var attributes: [NSAttributedString.Key: Any]
                switch attribute {
                case .bold:
                    attributes = [.font: UIFont.dmSans(size: 32, weight: .bold)]
                case .italics:
                    attributes = [.font: UIFont.dmSans(size: 32, weight: .italic)]
                }
                string.append(NSAttributedString(string: attributed, attributes: attributes))
            }

            scanner.currentIndex = scanner.string.index(scanner.currentIndex, offsetBy: tokens.count)
        }

        return string
    }
}

private enum Attribute {
    case bold
    case italics
}
