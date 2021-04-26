//
//  UIStackView+Convenience.swift
//  Created on 1/18/21
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
}
