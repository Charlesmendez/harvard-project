//
//  LabeledTextField.swift
//  Created on 1/18/21
//

import UIKit

final class LabeledTextField: ProgrammaticView {

    private let label = UILabel()
    public let field = PaddedTextField(horizontalPadding: 16)
    private let stackView = UIStackView()
    @Forward(\LabeledTextField.field.textContentType)
    var textContentType: UITextContentType!

    @Forward(\LabeledTextField.field.keyboardType)
    var keyboardType: UIKeyboardType

    @Forward(\LabeledTextField.field.autocapitalizationType)
    var autocapitalizationType: UITextAutocapitalizationType

    @Forward(\LabeledTextField.field.autocorrectionType)
    var autocorrectionType: UITextAutocorrectionType

    @Forward(\LabeledTextField.field.isSecureTextEntry)
    var isSecureTextEntry: Bool

    @Forward(\LabeledTextField.field.passwordRules)
    var passwordRules: UITextInputPasswordRules?

    init(label: String) {
        super.init()
        self.label.text = label
    }

    // MARK: - Setup

    override func configure() {
        label.font = .dmSans(size: 16)
        label.textColor = .white

        field.textColor = label.textColor
        field.font = .dmSans(size: 16)
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.white.cgColor

        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
    }

    override func constrain() {
        addConstrained(subview: stackView)
        stackView.addArrangedSubviews(label, field)

        label.setContentHuggingPriority(.defaultHigh, for: .vertical)
        let fieldHeight = field.heightAnchor.constraint(equalToConstant: 48)
        fieldHeight.priority = .defaultHigh
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fieldHeight
            
        ])
    }
}
