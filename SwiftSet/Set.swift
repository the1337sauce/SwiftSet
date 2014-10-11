//
//  Set.swift
//  SwiftSet
//
//  Created by Nathaniel Linsky on 10/11/14.
//  Copyright (c) 2014 Nathaniel Linsky. All rights reserved.
//

import Foundation


struct Set<T: Hashable> {
    
    var data: [T : T]
    
    var count: Int {
        return data.keys.array.count
    }
    
    
    init(){
        data = [T : T]()
    }
    
    init(_ array: [T]){
        self.init()
        for item in array{
            data.updateValue(item, forKey:item)
        }
    }
    
    func contains(element: T) -> Bool{
        return data[element] != nil
    }
    
    func member(element: T) -> T?{
        return data[element]
    }
    
    func filter(includeElement: (T) -> Bool) -> Set<T>{
        return Set(data.keys.array.filter(includeElement))
    }
    
    func map<U>(transform: (T) -> U) -> Set<U>{
        return Set<U>(data.keys.array.map(transform))
    }
    
    func reduce<U>(initial: U, combine: (U, T) -> U) -> U{
        return data.keys.array.reduce(initial, combine)
    }
    
    func all() -> [T]{
        return data.keys.array
    }
    
    mutating func add(newElement: T){
        if(!contains(newElement)){
            data.updateValue(newElement, forKey: newElement)
        }
    }
    
    mutating func remove(element: T){
        if(contains(element)){
            data.removeAtIndex(data.indexForKey(element)!)
        }
    }
    
    mutating func removeAll(){
        data.removeAll(keepCapacity: false)
    }
    
    subscript(element: T) -> T? {
        get {
            if let member = member(element)?{
                return member
            } else{
                return nil
            }
        }
    }
}

extension Set : SequenceType{
    func generate() -> SetGenerator<T>{
        return SetGenerator(set: self)
    }
}