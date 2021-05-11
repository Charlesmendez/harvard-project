//
//  GraphView.swift
//  Rove
//
//  Created by Carlos Fernando Mendez Solano on 5/4/21.
//

import UIKit

class GraphView: UIScrollView {
    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private let container = UIView()
    let controlsStackView = UIStackView()
    //public let imageView = UIImageView()
    let view = UIView()
    let photoButton = WideButton(label: .photoButton)
    let stackView = UIStackView(arrangedSubviews: [])
    var nodeDictionary = [String: String]()
    // MARK: - Setup
    

    override func layoutSubviews() {
        super.layoutSubviews()
        //imageView.roundedImage()
    }
    
    func configure() {
        backgroundColor = .roveBlack
        alwaysBounceVertical = true
        controlsStackView.axis = .vertical
        controlsStackView.spacing = 16
        controlsStackView.alignment = .fill
        container.accessibilityIdentifier = "container"
        //imageView.contentMode = .top
        //dump(imageArray2)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 40
    }
    var nodeList = [Node]()
    func constrain(){
        addConstrained(subviews: controlsStackView, stackView)
        controlsStackView.addArrangedSubviews(photoButton)
        let xPadding: CGFloat = 24
        NSLayoutConstraint.activate([
        controlsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        controlsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        photoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
        photoButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: xPadding),
        photoButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -xPadding),
        photoButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        stackView.topAnchor.constraint(equalTo: centerYAnchor, constant: -350),
        //This is making the space where all the images are. All share the same space.
        stackView.widthAnchor.constraint(equalToConstant: 50),
        //stackView.heightAnchor.constraint(equalToConstant: 600)
        ])
        // Append to the class the image and the parent and child tags
        
        for (imageIndex, image) in HomeViewController.imageArray.enumerated(){
            let imageView = UIImageView(image: image)
            stackView.addArrangedSubview(imageView)
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.layer.cornerRadius = 50 / 2
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = 2.0
            imageView.layer.borderColor = UIColor.white.cgColor
            var node = Node(image: image)
            nodeList.append(node)
            let tagsStartIndex = imageIndex * 2
            let tags = Array(PhotoImageViewController.nodeArray[tagsStartIndex..<tagsStartIndex+2])
            node.parent = tags[0]
            node.child = tags[1]
            node.imageView = imageView
            //print(node.image)
            //let CGFloat = imageView.bounds.origin
            //print(CGFloat)
            //print(node.parent!)
            //print(node.child!)
            view.layoutIfNeeded()
            let origin = imageView.frame.origin
            print("origin", origin)
            }
        
    }
    override func didMoveToWindow() {
        layoutIfNeeded()
        print("window", window)
        print("viewframe", frame)
        for outernode in nodeList{
            print("nodeframe", outernode.imageView?.frame)
            for innernode in nodeList{
                if outernode.child == innernode.parent {
                    print(outernode.child)
                    print(outernode.imageView?.frame.origin)
                    drawLineFromPoint(point1: outernode.imageView!.center, point2: innernode.imageView!.center)
                }
            }
        }
    }
    
    // Draw the lines to connect the nodes.
    func drawLineFromPoint(point1:CGPoint, point2:CGPoint) {
        let path = UIBezierPath()
        path.move(to: point1)
        path.addLine(to: point2)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.fillColor = UIColor.clear.cgColor
        stackView.layer.insertSublayer(shapeLayer, at: 0)
    }
}
fileprivate extension String {
    static let photoButton = NSLocalizedString("Add media", comment: "Label for photo button on graph screen")
    }
class Node{
    var image: UIImage
    var imageView: UIImageView?
    var parent: String?
    var child: String?
    init(image:UIImage) {
    self.image = image
    }
}

//              var counter = 1
//              for tag in PhotoImageViewController.nodeArray {
//                if (counter % 2 == 0) {
//                    node.child = tag
//                    counter += 1
//                } else {
//                    node.parent = tag
//                    counter += 1
//                }
//                //print(node.parent!)
//              }
              //print(parent)
