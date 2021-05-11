//
//  PhotoScreenView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/28/21.
//
import UIKit

class PhotoImageView: UIScrollView {
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
    let descriptionInput = LabeledTextField(label: .description)
    let view = UIView()
    let storeButton = WideButton(label: .storeButton)
    // MARK: - Setup

    func configure() {
        backgroundColor = .roveBlack
        alwaysBounceVertical = true
        controlsStackView.axis = .vertical
        controlsStackView.spacing = 16
        controlsStackView.alignment = .fill
        descriptionInput.autocapitalizationType = .none
        container.accessibilityIdentifier = "container"
        imageView.contentMode = .scaleAspectFill
    }
    func constrain(){
        addConstrained(subviews: controlsStackView, storeButton, imageView)
        controlsStackView.addArrangedSubviews(descriptionInput)
        let xPadding: CGFloat = 24
        NSLayoutConstraint.activate([
        descriptionInput.centerXAnchor.constraint(equalTo: centerXAnchor),
        descriptionInput.topAnchor.constraint(equalTo: centerYAnchor, constant: -90),
        //descriptionInput.widthAnchor.constraint(equalToConstant: 57),
        descriptionInput.field.heightAnchor.constraint(equalToConstant: 80),
        controlsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        controlsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        storeButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        storeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        storeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        storeButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        imageView.topAnchor.constraint(equalTo: centerYAnchor, constant: -300),
        imageView.widthAnchor.constraint(equalToConstant: 300),
        imageView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}

fileprivate extension String {
    static let description = NSLocalizedString("Description", comment: "Input label for description on photo screen")
    static let storeButton = NSLocalizedString("Store", comment: "Label for sign up button on sign up screen")

}
