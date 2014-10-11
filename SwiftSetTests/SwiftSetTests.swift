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
        developerSet.removeAll()
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
        developerSet.add(nate)
        XCTAssertTrue(developerSet.count == 1, "Developer was not added")
    }
    
    func testWeCanRemoveAnObject(){
        developerSet.add(joe)
        developerSet.remove(joe)
        XCTAssertTrue(developerSet.count == 0, "Developer was not removed")
    }
    
    func testWeCanRemoveAllObjects(){
        developerSet.add(nate)
        developerSet.add(joe)
        developerSet.add(bob)
        developerSet.removeAll()
        XCTAssertTrue(developerSet.count == 0, "All objects were not removed")
    }
    
    func testWeCanReturnProperObjectCount(){
        developerSet.add(nate)
        developerSet.add(joe)
        developerSet.add(bob)
        XCTAssertTrue(developerSet.count == 3, "We couldn't calculate count correctly")
    }
    
    func testWeCanCheckIfWeContainAnObject(){
        developerSet.add(nate)
        XCTAssertTrue(developerSet.contains(nate), "We didn't properly register containing an object")
    }
    
    func testWeCanGetAnObject(){
        developerSet.add(nate)
        let retrievedNate = developerSet.member(nate)
        XCTAssertTrue(retrievedNate != nil, "Object should have been returned and was not")
        XCTAssertTrue(nate == retrievedNate, "An incorrect object was returned")
    }
    
    func testWeCanGetAnObjectViaSubscripts(){
        developerSet.add(nate)
        let retrievedNate = developerSet[nate]
        XCTAssertTrue(retrievedNate != nil, "Object should have been returned and was not")
        XCTAssertTrue(nate == retrievedNate, "An incorrect object was returned")
    }
    
    func testWeCantAddTwoEqualObjects(){
        developerSet.add(nate)
        developerSet.add(nate)
        XCTAssertTrue(developerSet.count == 1, "Duplicate objects were added")
    }
    
    func testWeCanBuildASetWithAn   (){
        let developers = [nate, joe, bob]
        let localDeveloperSet = Set(developers)
        XCTAssertTrue(localDeveloperSet.count == 3, "Incorrect number of objects were added")
        XCTAssertTrue(localDeveloperSet.contains(nate), "Missing expected object")
        XCTAssertTrue(localDeveloperSet.contains(joe), "Missing expected object")
        XCTAssertTrue(localDeveloperSet.contains(bob), "Missing expected object")
    }
    
    func testWeCanFilterObjects(){
        developerSet.add(nate)
        developerSet.add(joe)
        developerSet.add(bob)
        let filteredResults = developerSet.filter({
            (developer: Developer) -> Bool in
            developer != self.bob
        })
        XCTAssertTrue(filteredResults.count == 2, "Filter didn't filter out the correct number of objects")
        XCTAssertTrue(filteredResults.contains(nate) && filteredResults.contains(joe), "Filter filtered out the wrong object")
    }
    
    func testWeCanMapObjects(){
        developerSet.add(nate)
        developerSet.add(joe)
        developerSet.add(bob)
        let developerNicknames = developerSet.map({
            (developer: Developer) -> String in
            developer.nickname
        })
    }
    
    func testWeCanReduceObjects(){
        var integerSet = Set<Int>()
        integerSet.add(3)
        integerSet.add(5)
        integerSet.add(11)
        let result = integerSet.reduce(1){
            $0 * $1
        }
        XCTAssertTrue(result == 165, "Reduce didn't function properly")
    }
    
    func testCanReturnAllElementsInAnArray(){
        developerSet.add(nate)
        developerSet.add(joe)
        developerSet.add(bob)
        let array = developerSet.all()
        XCTAssertTrue(array.count == 3, "Array has incorrect number of elements")
    }
}
