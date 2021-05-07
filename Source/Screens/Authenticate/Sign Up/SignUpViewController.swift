//
//  SignUpViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/29/21.
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        registerEvents()
        submitTapped()
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
//      Sign up the user and check if the user exists
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
            if error != nil {

                if let errCode = AuthErrorCode(rawValue: error!._code) {

                                switch errCode {
                                case.invalidEmail :
                                        print("invalid email")
                                case .emailAlreadyInUse:
                                    self.showAlertEmailExists(self)
                                        //print("in use")
                                    default:
                                        print("Create User Error: \(error!)")
                                }
                            }

                        }
                            else {
//                            print("all good... continue")
                                // take user to the Home View when Submit Tapped.
                                let vc = HomeViewController()
                                vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                                self.present(vc, animated: true, completion: nil)
                            }
                        }
        } 
    // MARK: - Re direction if Signed in tapped

    @objc
    private func signInTapped() {
        let vc = SignInViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
        print("signin botton tapped")
    }
    @IBAction func showAlertEmailExists(_ sender: Any) {

           // create the alert
           let alert = UIAlertController(title: "Email taken", message: "Email already in use. Try with another one.", preferredStyle: UIAlertController.Style.alert)

           // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in let vc = SignInViewController()
                                        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
                                        self.present(vc, animated: false, completion: nil) }))
           // show the alert
        DispatchQueue.main.async {
             self.present(alert, animated: true, completion: nil)
        }
       }
}
