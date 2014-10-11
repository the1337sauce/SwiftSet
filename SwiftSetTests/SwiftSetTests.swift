//
//  SwiftSetTests.swift
//  SwiftSetTests
//
//  Created by Nathaniel Linsky on 10/11/14.
//  Copyright (c) 2014 Nathaniel Linsky. All rights reserved.
//

import UIKit
import XCTest

class SwiftSetTests: XCTestCase {
    
    var developerSet = Set<Developer>()
    let nate = Developer(firstName: "Nate", nickname: "the1337sauce", bestLanguage: Developer.Language.Swift)
    
    let joe = Developer(firstName: "Joe", nickname: "Ozzy", bestLanguage:Developer.Language.Java)
    let bob = Developer(firstName: "Bob", nickname: "Bob Elite", bestLanguage:Developer.Language.Ruby)
    
    
    override func setUp() {
        super.setUp()
        developerSet.removeAllObjects()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        //self.measureBlock() {
        //    // Put the code you want to measure the time of here.
        //}
    }
    
    func testWeCanAddAnObject(){
        developerSet.addObject(nate)
        XCTAssertTrue(developerSet.count == 1, "Developer was not added")
    }
    
    func testWeCanRemoveAnObject(){
        developerSet.addObject(joe)
        developerSet.removeObject(joe)
        XCTAssertTrue(developerSet.count == 0, "Developer was not removed")
    }
    
    func testWeCanRemoveAllObjects(){
        developerSet.addObject(nate)
        developerSet.addObject(joe)
        developerSet.addObject(bob)
        developerSet.removeAllObjects()
        XCTAssertTrue(developerSet.count == 0, "All objects were not removed")
    }
    
    func testWeCanReturnProperObjectCount(){
        developerSet.addObject(nate)
        developerSet.addObject(joe)
        developerSet.addObject(bob)
        XCTAssertTrue(developerSet.count == 3, "We couldn't calculate count correctly")
    }
    
    func testWeCanCheckIfWeContainAnObject(){
        developerSet.addObject(nate)
        XCTAssertTrue(developerSet.containsObject(nate), "We didn't properly register containing an object")
    }
    
    func testWeCanGetAnObject(){
        developerSet.addObject(nate)
        let retrievedNate = developerSet.member(nate)
        XCTAssertTrue(retrievedNate != nil, "Object should have been returned and was not")
        XCTAssertTrue(nate == retrievedNate, "An incorrect object was returned")
    }
    
    func testWeCanGetAnObjectViaSubscripts(){
        developerSet.addObject(nate)
        let retrievedNate = developerSet[nate]
        XCTAssertTrue(retrievedNate != nil, "Object should have been returned and was not")
        XCTAssertTrue(nate == retrievedNate, "An incorrect object was returned")
    }
    
    func testWeCantAddTwoEqualObjects(){
        developerSet.addObject(nate)
        developerSet.addObject(nate)
        XCTAssertTrue(developerSet.count == 1, "Duplicate objects were added")
    }
}
