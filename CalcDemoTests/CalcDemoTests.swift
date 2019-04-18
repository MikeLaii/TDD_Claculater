//
//  CalcDemoTests.swift
//  CalcDemoTests
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import XCTest
@testable import CalcDemo

class CalcDemoTests: XCTestCase {

    let model: ViewModel = ViewModel()
    var result: String = "0"
    
    override func setUp() {
        
        model.outPut.handler = { [weak self] (value) in
            self?.result = value
        }
        testExample()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        testClean()
        testNumber()
        testAddition()
        testSubtraction()
        testMultiplication()
        testDivision()
        testSign()
        testPercentage()
        testDot()
        testEqual()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}


extension CalcDemoTests {
    
    func testClean() {
        result = "1234"
        model.run(.clean)
        XCTAssertTrue(result == "0")
    }
    func testNumber(){
        model.run(.clean)
        model.run(.one)
        XCTAssertTrue(result == "1")
        model.run(.zero)
        XCTAssertTrue(result == "10")
        model.run(.one)
        XCTAssertTrue(result == "101")
        model.run(.zero)
        XCTAssertTrue(result == "1010")
        model.run(.clean)
    }
    func testAddition(){
        model.run(.clean)
        model.run(.nine)
        model.run(.addition)
        XCTAssertTrue(result == "9")
        model.run(.one)
        XCTAssertTrue(result == "1")
        model.run(.addition)
        XCTAssertTrue(result == "10")
        model.run(.clean)
    }
    func testSubtraction(){
        model.run(.clean)
        model.run(.nine)
        model.run(.subtraction)
        XCTAssertTrue(result == "9")
        model.run(.one)
        XCTAssertTrue(result == "1")
        model.run(.subtraction)
        XCTAssertTrue(result == "8")
        model.run(.clean)
    }
    func testMultiplication(){
        model.run(.clean)
        model.run(.nine)
        model.run(.multiplication)
        XCTAssertTrue(result == "9")
        model.run(.nine)
        XCTAssertTrue(result == "9")
        model.run(.multiplication)
        XCTAssertTrue(result == "81")
        model.run(.clean)
    }
    func testDivision(){
        model.run(.clean)
        model.run(.nine)
        model.run(.division)
        XCTAssertTrue(result == "9")
        model.run(.three)
        XCTAssertTrue(result == "3")
        model.run(.division)
        XCTAssertTrue(result == "3")
        model.run(.clean)
    }
    func testSign(){
        model.run(.clean)
        model.run(.seven)
        XCTAssertTrue(result == "7")
        model.run(.sign)
        XCTAssertTrue(result == "-7")
        model.run(.sign)
        XCTAssertTrue(result == "7")
        model.run(.clean)
    }
    func testDot(){
        model.run(.clean)
        model.run(.one)
        model.run(.dot)
        XCTAssertTrue(result == "1.")
        model.run(.dot)
        XCTAssertTrue(result == "1.")
        model.run(.clean)
    }
    func testPercentage() {
        model.run(.clean)
        model.run(.seven)
        model.run(.percentage)
        XCTAssertTrue(result == "0.07")
        model.run(.percentage)
        XCTAssertTrue(result == "0.0007")
    }
    func testEqual(){
        model.run(.clean)
        model.run(.seven)
        model.run(.addition)
        model.run(.seven)
        model.run(.equal)
        XCTAssertTrue(result == "14")
        model.run(.equal)
        XCTAssertTrue(result == "21")

        model.run(.clean)
        model.run(.nine)
        model.run(.subtraction)
        model.run(.one)
        model.run(.equal)
        XCTAssertTrue(result == "8")
        model.run(.equal)
        XCTAssertTrue(result == "7")

        model.run(.clean)
        model.run(.seven)
        model.run(.multiplication)
        model.run(.two)
        model.run(.equal)
        XCTAssertTrue(result == "14")
        model.run(.equal)
        XCTAssertTrue(result == "28")

        model.run(.clean)
        model.run(.seven)
        model.run(.division)
        model.run(.two)
        model.run(.equal)
        XCTAssertTrue(result == "3.5")
        model.run(.equal)
        XCTAssertTrue(result == "1.75")
    }

    
}
