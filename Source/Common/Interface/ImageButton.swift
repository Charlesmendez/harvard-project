//
//  SignUpViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/29/21.
//

import UIKit

final class ImageButton: UIImageView {

    // MARK: - Init

    init(named: String) {
        guard let image = UIImage(named: named) else {
            fatalError("Missing image: \(named)")
        }
        super.init(frame: .zero)
        imageView.image = image
        configure()
        constrain()
    }

    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }

    // MARK: - Setup

    private let imageView = UIImageView()

    func configure() {}

    func constrain() {
        addConstrained(subview: imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
