//
//  GraphView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 5/4/21.
//

import UIKit

class GraphView: UIScrollView {
    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let container = UIView()
    let controlsStackView = UIStackView()
    public let imageView = UIImageView()
    let view = UIView()
    let photoButton = WideButton(label: .photoButton)
    // MARK: - Setup

    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.roundedImage()
    }
    
    func configure() {
        backgroundColor = .roveBlack
        alwaysBounceVertical = true
        controlsStackView.axis = .vertical
        controlsStackView.spacing = 16
        controlsStackView.alignment = .fill
        container.accessibilityIdentifier = "container"
        imageView.contentMode = .scaleAspectFill
    }
    func constrain(){
        addConstrained(subviews: controlsStackView, imageView)
        controlsStackView.addArrangedSubviews(photoButton)
        let xPadding: CGFloat = 24
        NSLayoutConstraint.activate([
        controlsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        controlsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        photoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        photoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        photoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        photoButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        imageView.topAnchor.constraint(equalTo: centerYAnchor, constant: -300),
        imageView.widthAnchor.constraint(equalToConstant: 50),
        imageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

fileprivate extension String {
    static let photoButton = NSLocalizedString("Add media", comment: "Label for photo button on graph screen")

}

extension UIImageView {
    func roundedImage() {
        //let nodeImageViewWidth: CGFloat = 100
        self.layer.cornerRadius = frame.size.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
    }
}
