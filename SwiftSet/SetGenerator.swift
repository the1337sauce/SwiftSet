//
//  SetGenerator.swift
//  SwiftSet
//
//  Created by Nathaniel Linsky on 10/11/14.
//  Copyright (c) 2014 Nathaniel Linsky. All rights reserved.
//

import Foundation

struct SetGenerator<T: Hashable> : GeneratorType{

    var allObjects: [T]
    var index = 0
    
    init(set: Set<T>){
        allObjects = set.all()
    }
    
    mutating func next() -> T? {
        if (index == allObjects.count) { return .None }
        let element = allObjects[index]
        index++
        return element
    }
}