//
//  Developer.swift
//  SwiftSet
//
//  Created by Nathaniel Linsky on 10/11/14.
//  Copyright (c) 2014 Nathaniel Linsky. All rights reserved.
//

import Foundation


struct Developer: Equatable, Hashable{
    
    enum Language{
        case Swift, ObjectiveC, Java, Ruby, Python, Scala
    }
    
    let firstName: String
    let nickname: String
    let bestLanguage: Language
    
    var hashValue: Int {
        return firstName.hashValue ^ nickname.hashValue ^ bestLanguage.hashValue
    }
    
    init(firstName: String, nickname: String, bestLanguage: Language){
        self.firstName = firstName
        self.nickname = nickname
        self.bestLanguage = bestLanguage
    }
}

func ==(lhs: Developer, rhs: Developer) -> Bool{
    return lhs.firstName == rhs.firstName && lhs.nickname == rhs.nickname && lhs.bestLanguage == rhs.bestLanguage
}