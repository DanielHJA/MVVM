//
//  SettingsTableViewCell.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class SettingsTableViewCell: BaseTableViewCell<SettingsObject> {
    
    private let settingsManager: SettingsManager = SettingsManager()
    
    override var object: SettingsObject? {
        didSet {
            guard let object = object else { return }
            label.text = object.name
            activeSwitch.isOn = object.isOn
            containerConstraintInsets(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20))
        }
    }
    
    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.black
        temp.textAlignment = .left
        temp.minimumScaleFactor = 0.7
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        container.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.leadingAnchor.constraint(equalTo: container.leadingAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: activeSwitch.leadingAnchor).isActive = true
        temp.topAnchor.constraint(equalTo: container.topAnchor).isActive = true
        temp.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        return temp
    }()
    
    private lazy var activeSwitch: UISwitch = {
        let temp = UISwitch()
        temp.addTarget(self, action: #selector(didFlipSwitch(_:)), for: .valueChanged)
        container.addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temp.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10.0).isActive = true
        return temp
    }()
    
    override func setCharacteristics() {
        selectionStyle = .none
    }
    
    @objc private func didFlipSwitch(_ sender: UISwitch) {
        guard var object = object else { return }
        object.isOn = sender.isOn
        settingsManager.changeSettingsForObject(object)
    }
    
}
