//
//  Label.swift
//  Created on 1/18/21
//

import UIKit

final class Label: UILabel {

    // MARK: - Init

    init(text: String, fontSize: CGFloat = 16) {
        super.init(frame: .zero)
        self.text = text
        font = .dmSans(size: fontSize)
        textColor = .white
    }

    init(text: NSAttributedString, fontSize: CGFloat = 16) {
        super.init(frame: .zero)
        attributedText = text.with(fontSize: fontSize)
        textColor = .white
    }

    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }
}
