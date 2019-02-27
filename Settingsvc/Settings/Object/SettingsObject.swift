//
//  SettingsObject.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

enum SettingsType {
    case one, two, three, four, five
}

struct SettingsObject {
    
    var name: String
    var isOn: Bool
    var type: SettingsType
    
}
