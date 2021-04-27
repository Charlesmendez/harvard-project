//
//  EmptyHomeView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/26/21.
//

import UIKit

final class EmptyHomeView: UIScrollView {
    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let container = UIView()
    private let image = UIImageView()
    private let descriptionLabel = Label(text: .description)
    let uploadButton = WideButton(label: .upload)

    // MARK: - Setup

    func configure() {
        backgroundColor = .roveBlack

        container.accessibilityIdentifier = "container"
        image.image = UIImage(named: "Tabs/Home/Empty")
        image.contentMode = .scaleAspectFit
        uploadButton.addTarget(self, action: #selector(uploadButtonTapped), for: .touchUpInside)
    }

    func constrain() {
        addConstrained(subview: container)
        container.addConstrained(subviews: image, descriptionLabel, uploadButton)

        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),

            image.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            image.topAnchor.constraint(equalTo: container.topAnchor),
            image.heightAnchor.constraint(equalToConstant: 240),
            image.widthAnchor.constraint(equalToConstant: 240),

            descriptionLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 43.6),

            uploadButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 24),
            uploadButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -24),
            uploadButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            uploadButton.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }

    // MARK: - Actions

    @objc
    private func uploadButtonTapped() {
        print("upload tapped")
    }
}

// MARK: - Delegate

protocol EmptyHomeViewDelegate: class {
    func uploadImageTapped()
}

// MARK: - Localized Strings

fileprivate extension String {
    static let description = NSLocalizedString("EMPTY_HOME_INSTRUCTIONS",
                                               value: "Upload your first image here", comment: "Home screen")
    static let upload = NSLocalizedString("EMPTY_HOME_UPLOAD", value: "Upload Image", comment: "Home screen")
}
