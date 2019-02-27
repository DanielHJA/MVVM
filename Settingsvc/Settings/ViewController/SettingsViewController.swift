//
//  SettingsViewController.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class SettingsViewController: BaseTableViewController<SettingsTableViewCell, SettingsObject, SettingsViewModel> {
    
    override func viewModelInitialized(_ model: SettingsViewModel) {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = viewModel!.settingItems
        
        isLoading = true
        
        delay(1.0) {
            self.delay(1.0) {
                self.loadingView.loadingState = .state("Loading")
                self.delay(1.0) {
                    self.loadingView.loadingState = .state("Finishing")
                    self.delay(1.0, completion: {
                        self.isLoading = false
                    })
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

}

