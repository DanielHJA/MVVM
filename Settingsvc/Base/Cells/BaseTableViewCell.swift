//
//  BaseTableViewCell.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class BaseTableViewCell<O>: UITableViewCell {

    private lazy var containerLeadingAnchor: NSLayoutConstraint = {
        let temp = container.leadingAnchor.constraint(equalTo: leadingAnchor)
        return temp
    }()
    
    private lazy var containerTrailingAnchor: NSLayoutConstraint = {
        let temp = container.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        return temp
    }()
    
    private lazy var containerTopAnchor: NSLayoutConstraint = {
        let temp = container.topAnchor.constraint(equalTo: topAnchor)
        return temp
    }()
    
    private lazy var containerBottomAnchor: NSLayoutConstraint = {
        let temp = container.bottomAnchor.constraint(equalTo: bottomAnchor)
        return temp
    }()
    
    lazy var container: UIView = {
        let temp = UIView()
        return temp
    }()
    
    var object: O?

    func setupWithObject(_ object: O) {
        addContainer()
        self.object = object
    }
    
    private func addContainer() {
        setCharacteristics()
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                containerTopAnchor,
                containerTrailingAnchor,
                containerBottomAnchor,
                containerLeadingAnchor
            ]
        )
    }
    
    func setCharacteristics() { }
    
    func containerConstraintInsets(_ insets: UIEdgeInsets) {
        containerLeadingAnchor.constant = insets.left
        containerTrailingAnchor.constant = insets.right
        containerTopAnchor.constant = insets.top
        containerBottomAnchor.constant = insets.bottom
    }
    
}
