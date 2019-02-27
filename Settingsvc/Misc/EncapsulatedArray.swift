//
//  EncapsulatedArray.swift
//  Settingsvc
//
//  Created by Daniel Hjärtström on 2019-02-19.
//  Copyright © 2019 Sog. All rights reserved.
//

import UIKit

class EncapsulatedArray<T> {

    private(set) var array = [T]()
    
    func append(_ item: T) {
        array.append(item)
    }
    
    func append(_ items: [T]) {
        _ = items.compactMap { array.append($0) }
    }
    
    func count() -> Int {
        return array.count
    }
    
    func removeAtIndex(_ index: Int) {
        array.remove(at: index)
    }
    
    func mutableCopy() -> [T] {
        return array
    }
    
    func replaceWithNewArray(_ array: [T]) {
        self.array = array
    }
    
}
