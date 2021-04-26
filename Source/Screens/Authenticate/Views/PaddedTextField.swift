//
//  PaddedTextField.swift
//  Created on 1/18/21
//

import UIKit

final class PaddedTextField: UITextField {
    private let horizontalPadding: CGFloat

    init(horizontalPadding: CGFloat) {
        self.horizontalPadding = horizontalPadding
        super.init(frame: .zero)
    }

    @available(*, unavailable, message: "Override setup() instead")
    required init(coder aDecoder: NSCoder) {
        fatalError("Not defined")
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: horizontalPadding, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        textRect(forBounds: bounds)
    }
}
