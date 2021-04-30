//
//  LabelButton.swift
//  Created on 1/18/21
//

import UIKit

final class LabelButton: UIButton {

    // MARK: - Init

    init(text: String, fontSize: CGFloat = 16) {
        label = Label(text: text, fontSize: fontSize)
        super.init(frame: .zero)
        setup()
    }

    init(text: NSAttributedString, fontSize: CGFloat = 16) {
        label = Label(text: text, fontSize: fontSize)
        super.init(frame: .zero)
        setup()
    }

    private func setup() {
        configure()
        constrain()
    }

    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }

    // MARK: - Setup

    let label: Label

    func configure() {
        label.numberOfLines = 0
        label.textAlignment = .center
    }

    func constrain() {
        addConstrained(subview: label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
