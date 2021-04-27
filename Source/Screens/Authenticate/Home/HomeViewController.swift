//
//  HomeViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/26/21.
//


import UIKit
import Firebase
import AuthenticationServices
import FirebaseAuth

class HomeViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - View Lifecycle

    public var emptyView: EmptyHomeView!

    override func loadView() {
        emptyView = EmptyHomeView()
        emptyView.delegate = self
        view = emptyView
        uploadImageTapped()
    }

    // MARK: - Register Events, Bindings

    func registerEvents() {

    }

    func bind() {

    }
    @objc
    func uploadImageTapped() {
        print("Upload tapped")
        emptyView.uploadButton.addTarget(self, action: #selector(showImagePickerController), for: .touchUpInside)
    }
}

// MARK: - Home View Delegates
// Media picker. Code examples from here https://www.youtube.com/watch?v=JYkj1UmQ6_g

 extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func showImagePickerController() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: true, completion: nil)
        }
    }
