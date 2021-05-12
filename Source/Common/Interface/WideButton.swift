//
//  SignUpViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/29/21.
//

import UIKit

final class WideButton: UIButton {

    @Forward(\WideButton.label.textColor)
    var textColor: UIColor!

    // MARK: - Init

    init(label: String) {
        super.init(frame: .zero)
        self.label.text = label
        configure()
        constrain()
    }

    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }

    // MARK: - Setup

    private let label = UILabel()

    func configure() {
        backgroundColor = .white

        label.textColor = .roveBlack
    }

    func constrain() {
        addConstrained(subview: label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 48)
    }
}
