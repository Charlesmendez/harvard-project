//
//  SignUpViewController.swift
//  Created on 1/18/21
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseAuth

class SignUpViewController: UIViewController, UIScrollViewDelegate {

    private var signUpView: SignUpView!

    override func loadView() {
        signUpView = SignUpView()
        signUpView.delegate = self
        view = signUpView
    }
//    // Show the keybord
//    func viewDidAppear( animated: Bool) {
//        super.viewDidAppear(animated)
//        view.becomeFirstResponder()
//    }
    // Closes keyboard when tap in screen
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        registerEvents()
    }
    // MARK: - Register Events

    func registerEvents() {
        signUpView.signUpButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        signUpView.signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        // signUpView.nameInput.delegate = self
    }
    @objc private func submitTapped() {
        guard let email = signUpView.emailInput.field.text, !email.isEmpty,
              let name = signUpView.nameInput.field.text, !name.isEmpty,
              let password = signUpView.passwordInput.field.text, !password.isEmpty else {
            print("missing field data")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
        //present(HomeViewController(), animated: true)
        let vc = HomeViewController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    // MARK: - Re direction if Signed in tapped

    @objc
    private func signInTapped() {
//        let detailVC = HomeViewController()
//        let navigationController = UINavigationController(rootViewController: detailVC)
//        navigationController.modalPresentationStyle = .fullScreen
        print("signin botton tapped")
    }
}
