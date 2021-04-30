//
//  SignInView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/29/21.
//

import UIKit

final class SignInView: UIScrollView {
    required init(coder aDecoder: NSCoder) { fatalError("Not defined") }
    
    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }
    // MARK: - Properties

    // MARK: - Properties
        private let logoView = UIImageView()
        private let container = UIView()
        let controlsStackView = UIStackView()
        let margin: CGFloat = 24
        let emailInput = LabeledTextField(label: .email)
        let passwordInput = LabeledTextField(label: .password)
        let signInButton = WideButton(label: .signInButton)
        let forgotPasswordButton = LabelButton(text: .forgotPassword, fontSize: 16)
        private let dontHaveAnAccount = Label(text: .dontHaveAnAccount)
        let signUpButton = WideButton(label: .signUpButton)    
    // MARK: - Setup
        func configure() {
            backgroundColor = .roveBlack
            alwaysBounceVertical = true
            
            container.accessibilityIdentifier = "container"
            logoView.image = UIImage(named: "Authentication/Logo")
            emailInput.autocapitalizationType = .none
            emailInput.keyboardType = .emailAddress
            passwordInput.isSecureTextEntry = true
            passwordInput.textContentType = .newPassword
            passwordInput.passwordRules = .init(descriptor: [
                                                    "required: upper", "required: lower", "required: digit",
                                                    "max-consecutive: 2", "minlength: 8"].joined(separator: "; "))

            controlsStackView.axis = .vertical
            controlsStackView.spacing = 16
            controlsStackView.alignment = .fill
            
            signUpButton.backgroundColor = nil
            signUpButton.textColor = .white
            signUpButton.layer.borderWidth = 1
            signUpButton.layer.borderColor = UIColor.white.cgColor
        }

        func constrain() {
            addConstrained(subviews: logoView, controlsStackView, forgotPasswordButton, signUpButton)
            controlsStackView.addArrangedSubviews(emailInput, passwordInput, signInButton, dontHaveAnAccount)
            let xPadding: CGFloat = 24
            
            NSLayoutConstraint.activate([
                logoView.centerXAnchor.constraint(equalTo: centerXAnchor),
                logoView.topAnchor.constraint(equalTo: topAnchor, constant: xPadding),
                logoView.widthAnchor.constraint(equalToConstant: 57),
                logoView.heightAnchor.constraint(equalToConstant: 80),
                
                controlsStackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 64),
                controlsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
                controlsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),

                forgotPasswordButton.label.topAnchor.constraint(equalTo: controlsStackView.bottomAnchor, constant: margin),
                forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),

                signUpButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                signUpButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
                signUpButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
                signUpButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24)
            ])
        }
}

fileprivate extension String {
    static let signInButton = NSLocalizedString("Sign In", comment: "Label for sign in button")
    static let forgotPassword = NSLocalizedString("Forgot Password?",
                                                  comment: "Label for password reset on sign in screen")
    static let dontHaveAnAccount = NSLocalizedString("Don't have an account?",
                                                        comment: "Label above sign up button on sign in screen")

    static let signUpButton = NSLocalizedString("Sign Up", comment: "Label for sign up button")
    
    static let email = NSLocalizedString("Email", comment: "Input label for email on sign up screen")
    
    static let password = NSLocalizedString("Password", comment: "Input label for password on sign up screen")
    
}
