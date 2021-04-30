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

class PhotoImageViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - View Lifecycle

    public var photoView: PhotoImageView!

    override func loadView() {
        photoView = PhotoImageView()
        photoView.delegate = self
        view = photoView

    }
    // MARK: - Register Events, Bindings

    func registerEvents() {

    }

    func bind() {

    }
}
