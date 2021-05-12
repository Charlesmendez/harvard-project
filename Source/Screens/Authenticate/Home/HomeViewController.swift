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
    static var imageArray = [UIImage]()

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
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        }
    // Picker to select the media and edit it. Once selected send the user to the other view. It also appends the image to the image array.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        dismiss(animated: false, completion: { [self] in if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        { let vc = PhotoImageViewController()
            vc.image = editedImage
            HomeViewController.imageArray.append(editedImage)
            self.present(vc, animated: false, completion: nil)
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            let vc = PhotoImageViewController()
            vc.image = originalImage
            HomeViewController.imageArray.append(originalImage)
            self.present(vc, animated: false, completion: nil)
        }
        })
        }
    }
