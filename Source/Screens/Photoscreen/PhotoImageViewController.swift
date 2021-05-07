//
//  PhotoScreenViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/28/21.
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseAuth
import Parsing

class PhotoImageViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var imageView: UIImageView!
    var image: UIImage?
    // MARK: - View Lifecycle

    private var photoImageView: PhotoImageView!

    override func loadView() {
        photoImageView = PhotoImageView()
        photoImageView.delegate = self
        photoImageView.imageView.image = image
        view = photoImageView
//        setupNavBar()

    }
    // MARK: - Register Events, Bindings
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        registerEvents()
    }
    func registerEvents() {
        photoImageView.storeButton.addTarget(self, action: #selector(storeTapped), for: .touchUpInside)
    }

    @objc
    private func storeTapped() {
        let currentDateTime = Date()
        guard let description = photoImageView.descriptionInput.field.text, !description.isEmpty
        else {
            print(currentDateTime)
            return
            }
        // PARSER: Uses this library https://github.com/pointfreeco/swift-parsing#getting-started installed via Swift Packages
        let specialString = Skip(PrefixThrough("[["))
          .take(PrefixUpTo("]]"))
          .skip(StartsWith("]]"))
        let allSpecials = Many(specialString)
        if let results = allSpecials.parse(description) {
            print(results)
            if results.isEmpty{
                print(currentDateTime)
            }
          }else {
            print("--Nada--")
          }
        let vc = GraphViewController()
        vc.image = image
        self.present(vc, animated: false, completion: nil)
    }
}
