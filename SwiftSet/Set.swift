//
//  Set.swift
//  SwiftSet
//
//  Created by Nathaniel Linsky on 10/11/14.
//  Copyright (c) 2014 Nathaniel Linsky. All rights reserved.
//

import Foundation


struct Set<T: Hashable>{
    
    var data: [T : T]
    
    var count: Int {
        return data.keys.array.count
    }
    
    
    init(){
        data = [T : T]()
    }
    
    func containsObject(object: T) -> Bool{
        return data[object] != nil
    }
    
    func member(object: T) -> T?{
        return data[object]
    }
    
    mutating func addObject(object: T){
        if(!containsObject(object)){
            data.updateValue(object, forKey: object)
        }
    }
    
    mutating func removeObject(object: T){
        if(containsObject(object)){
            data.removeAtIndex(data.indexForKey(object)!)
        }
    }
    
    mutating func removeAllObjects(){
        data.removeAll(keepCapacity: false)
    }
    
    subscript(object: T) -> T? {
        get {
            if let member = member(object)?{
                return member
            } else{
                return nil
            }
        }
        set(newValue) {
            addObject(object)
        }
    }
}