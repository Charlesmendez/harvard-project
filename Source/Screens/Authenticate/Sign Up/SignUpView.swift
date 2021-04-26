//
//  SignUpView.swift
//

import UIKit

final class SignUpView: UIScrollView {
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }
    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }
    // MARK: - Properties

    private let logoView = UIImageView()

    private let controlsStackView = UIStackView()
    let nameInput = LabeledTextField(label: .name)
    let emailInput = LabeledTextField(label: .email)
    let passwordInput = LabeledTextField(label: .password)
    let signUpButton = WideButton(label: .signUpButton)
    private let thirdPartyStackView = UIStackView()
    private let alreadyHaveAnAccount = Label(text: .alreadyHaveAnAccount)
    let signInButton = WideButton(label: .signInButton)

    // MARK: - Setup

    func configure() {
        backgroundColor = .roveBlack
        alwaysBounceVertical = true

        logoView.image = UIImage(named: "Authentication/Logo")
        nameInput.textContentType = .name

        controlsStackView.axis = .vertical
        controlsStackView.spacing = 16
        controlsStackView.alignment = .fill

        emailInput.autocapitalizationType = .none
        emailInput.keyboardType = .emailAddress
        passwordInput.isSecureTextEntry = true
        passwordInput.textContentType = .newPassword
        passwordInput.passwordRules = .init(descriptor: [
                                                "required: upper", "required: lower", "required: digit",
                                                "max-consecutive: 2", "minlength: 8"].joined(separator: "; "))

        signInButton.backgroundColor = nil
        signInButton.textColor = .white
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
    }

    func constrain() {
        addConstrained(subviews: logoView, controlsStackView,
                        alreadyHaveAnAccount, signInButton)
        controlsStackView.addArrangedSubviews(nameInput, emailInput, passwordInput, signUpButton)

        let xPadding: CGFloat = 24

        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoView.topAnchor.constraint(equalTo: topAnchor, constant: xPadding),
            logoView.widthAnchor.constraint(equalToConstant: 57),
            logoView.heightAnchor.constraint(equalToConstant: 80),

            controlsStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 64),
            controlsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
            controlsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),

            alreadyHaveAnAccount.centerXAnchor.constraint(equalTo: centerXAnchor),
            alreadyHaveAnAccount.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
            signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
            signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
            signInButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
}

// MARK: - Localized Strings

fileprivate extension String {
    static let name = NSLocalizedString("Name", comment: "Input label for name on sign up screen")
    static let email = NSLocalizedString("Email", comment: "Input label for email on sign up screen")
    static let password = NSLocalizedString("Password", comment: "Input label for password on sign up screen")
    static let signUpButton = NSLocalizedString("Sign Up", comment: "Label for sign up button on sign up screen")
    static let alreadyHaveAnAccount = NSLocalizedString("Already have an account?",
                                                        comment: "Label above sign in button on sign up screen")

    static let signInButton = NSLocalizedString("Sign In", comment: "Sign in button on sign up screen")
}
