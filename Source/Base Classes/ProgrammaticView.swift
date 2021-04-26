//
//  ProgrammaticView.swift
//  Created on 1/18/21
//

import UIKit

class ProgrammaticView: UIView {

    // MARK: - Init

    init() {
        super.init(frame: .zero)
        configure()
        constrain()
    }

    @available(*, unavailable, message: "Override configure() instead")
    required init(coder aDecoder: NSCoder) {
        fatalError("Not defined")
    }

    // MARK: - Setup

    func configure() {}

    func constrain() {}
}
