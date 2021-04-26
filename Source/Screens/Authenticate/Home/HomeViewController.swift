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

final class HomeViewController: UIViewController, UIScrollViewDelegate {

    // MARK: - View Lifecycle

    public var emptyView: EmptyHomeView!

    override func loadView() {
        emptyView = EmptyHomeView()
        emptyView.delegate = self
        view = emptyView
    }

    // MARK: - Register Events, Bindings

    func registerEvents() {

    }

    func bind() {

    }
}

// MARK: - Home View Delegates

extension HomeViewController: EmptyHomeViewDelegate {
    func uploadImageTapped() {
        print("Upload tapped")
    }
}
