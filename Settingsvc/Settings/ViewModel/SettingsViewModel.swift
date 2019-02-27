//
//  SettingsViewModel.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class SettingsViewModel: BaseViewModel {
    
    var settingItems: [[SettingsObject]] = {
       return [
        [
            SettingsObject(name: "Setting one", isOn: false, type: .one),
            SettingsObject(name: "Setting two", isOn: false, type: .two),
            SettingsObject(name: "Setting three", isOn: true, type: .three),
            SettingsObject(name: "Setting four", isOn: false, type: .four),
            SettingsObject(name: "Setting five", isOn: true, type: .five)]
        ]
    }()

}
