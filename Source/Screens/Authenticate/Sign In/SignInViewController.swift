//
//  SignInViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/29/21.
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseAuth

final class SignInViewController: UIViewController, UIScrollViewDelegate {

    private var signInView: SignInView!

    override func loadView() {
        super.loadView()
        signInView = SignInView()
        //signInView.delegate = self
        view = signInView
        //uploadImageTapped()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        registerEvents()
    }
    // MARK: - Register Events, Bindings

    func registerEvents() {
        signInView.signInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        signInView.signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    }
    // MARK: - View Events

    @objc
    private func forgotPasswordTapped() {
    }

    @objc
    private func signInTapped() {
        guard let email = signInView.emailInput.field.text, !email.isEmpty,
              let password = signInView.passwordInput.field.text, !password.isEmpty else {
            print("missing field data")
            return
            }
        //Sign up the user and check if the user exists
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
          // ...
                if error != nil {

                    if let errCode = AuthErrorCode(rawValue: error!._code) {

                                    switch errCode {
                                    case.invalidEmail:
                                            print("invalid email")
                                    case.accountExistsWithDifferentCredential:
                                            print("accountExistsWithDifferentCredential")
                                        default:
                                            print("Sign in User Error: \(error!)")
                                    }
                                }

                            }
                                else {
                                    // take user to the Home View when Submit Tapped.
                                    let vc = HomeViewController()
                                    vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                                    self?.present(vc, animated: true, completion: nil)
                                }
                            }
                    }
        @objc private func signUpTapped() {
            let vc = SignUpViewController()
            vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
            self.present(vc, animated: true, completion: nil)
            }
}
    

    

