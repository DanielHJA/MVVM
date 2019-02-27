//
//  LoadingView.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-20.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

enum LoadingState {
    case state(String)
    
    var description: String {
        switch self {
        case .state(let text):
            return text
        }
    }
}

class LoadingView: UIView {
    
    var loadingState: LoadingState = .state("") {
        didSet {
            label.text = loadingState.description
        }
    }

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView()
        temp.style = .whiteLarge
        temp.color = UIColor.white
        temp.startAnimating()
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temp.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temp.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        temp.widthAnchor.constraint(equalTo: temp.heightAnchor).isActive = true
        return temp
    }()
    
    private lazy var label: UILabel = {
        let temp = UILabel()
        temp.textColor = UIColor.white
        temp.textAlignment = .center
        temp.minimumScaleFactor = 0.7
        temp.adjustsFontSizeToFitWidth = true
        temp.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        addSubview(temp)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalTo: activityIndicator.widthAnchor, multiplier: 1.5).isActive = true
        temp.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 5.0).isActive = true
        temp.centerXAnchor.constraint(equalTo: activityIndicator.centerXAnchor).isActive = true
        return temp
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureFrames()
    }
    
    private func configureFrames() { }
    
    private func commonInit() {
        backgroundColor = UIColor.black.withAlphaComponent(0.6)
        activityIndicator.isHidden = false
        loadingState = .state("Starting")
    }

}
