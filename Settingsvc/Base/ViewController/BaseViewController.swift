//
//  ViewController.swift
//  MVVM
//
//  Created by Daniel Hjärtström on 2019-02-18.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class BaseViewController<V: BaseViewModel>: UIViewController {
    
    // 3
    var viewModel: V? {
        didSet {
            guard let model = viewModel else { return }
            viewModelInitialized(model)
        }
    }
    
    // 1
    init() {
        super.init(nibName: nil, bundle: nil)
        instantiateViewModel()
    }
    
    // 2
    private func instantiateViewModel() {
        viewModel = V.init()
    }

    // 4
    func viewModelInitialized(_ model: V) { }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

