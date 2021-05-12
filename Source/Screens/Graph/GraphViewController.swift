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
    
    // MARK: - View Lifecycle

    private var graphView: GraphView!

    override func loadView() {
        graphView = GraphView()
        graphView.delegate = self
        view = graphView
    }
    // MARK: - Register Events, Bindings
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        registerEvents()
       // nodes.axis = .vertical
        
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
