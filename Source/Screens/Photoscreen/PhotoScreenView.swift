//
//  PhotoScreenView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 4/28/21.
//
import UIKit

class PhotoImageView: UIScrollView {
    init() {
        super.init(frame: .zero)
        configure()
        //constrain()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public let container = UIView()
    public let image = UIImageView()
    // MARK: - Setup

    func configure() {
        backgroundColor = .roveBlack

        container.accessibilityIdentifier = "container"
        image.image = UIImage(named: "Tabs/Home/Empty")
        image.contentMode = .scaleAspectFit
        let profileImageViewWidth: CGFloat = 100
        var profileImageView: UIImageView = {
            let iv = UIImageView()
            //iv.image = image.withRenderingModel(.alwaysOriginal)
            iv.contentMode = .scaleAspectFill
            iv.layer.cornerRadius = profileImageViewWidth
            iv.layer.masksToBounds = true
            return iv
        }()
    }
//    func constrain(){
//        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
//    }
}
