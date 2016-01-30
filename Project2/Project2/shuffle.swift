//
//  shuffle.swift
//  Project2
//
//  Created by jimmychain on 1/16/16.
//  Copyright © 2016 jimmychain. All rights reserved.
//

import Foundation


// (c) 2015 Nate Cook, licensed under the MIT license
//
// Fisher-Yates shuffle as protocol extensions

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
