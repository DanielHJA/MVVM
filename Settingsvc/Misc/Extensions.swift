//
//  Extensions.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: type(of: self))
    }
}

extension NSObject {
    func delay(_ time: Double, completion: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + time) {
            completion()
        }
    }
}

extension UIApplication {
    static func keyWindow() -> UIWindow? {
        return UIApplication.shared.keyWindow
    }
}
