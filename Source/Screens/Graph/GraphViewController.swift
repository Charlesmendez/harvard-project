//
//  GraphViewController.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 5/4/21.
//

import UIKit
import Firebase
import AuthenticationServices
import FirebaseAuth
import Parsing

class GraphViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet var imageView: UIImageView!
    var image: UIImage?
    //var imageArray2 = [UIImage]()
    // MARK: - View Lifecycle

    private var graphView: GraphView!

    override func loadView() {
        graphView = GraphView()
        graphView.delegate = self
        graphView.imageView.image = image
        // stackview attempt
        view = graphView
//        view.addSubview(imageView)
//        let nodes = UIStackView(arrangedSubviews: [view])
//        nodes.axis = .vertical
//        setupNavBar()

    }
    // MARK: - Register Events, Bindings
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        registerEvents()
        let otherVC = HomeViewController()
        //imageArray2 = otherVC.imageArray
        //print(imageArray2)
    }
    func registerEvents() {
        graphView.photoButton.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
    }
    let vc = HomeViewController()
    @objc
    private func addTapped() {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
