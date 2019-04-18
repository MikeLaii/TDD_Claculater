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

    let viewModel: ViewModel = ViewModel()
    var result: String = "0"
    
    override func setUp() {
        
        viewModel.outPut = { [weak self] (value) in
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
        viewModel.run(.clean)
        XCTAssertTrue(result == "0")
    }
    func testNumber(){
        viewModel.run(.clean)
        viewModel.run(.one)
        XCTAssertTrue(result == "1")
        viewModel.run(.zero)
        XCTAssertTrue(result == "10")
        viewModel.run(.one)
        XCTAssertTrue(result == "101")
        viewModel.run(.zero)
        XCTAssertTrue(result == "1010")
        viewModel.run(.clean)
    }
    func testAddition(){
        viewModel.run(.clean)
        viewModel.run(.nine)
        viewModel.run(.addition)
        viewModel.run(.one)
        viewModel.run(.equal)
        XCTAssertTrue(result == "10")
        viewModel.run(.equal)
        XCTAssertTrue(result == "11")
        viewModel.run(.clean)
    }
    func testSubtraction(){
        viewModel.run(.clean)
        viewModel.run(.nine)
        viewModel.run(.subtraction)
        viewModel.run(.one)
        viewModel.run(.equal)
        XCTAssertTrue(result == "8")
        viewModel.run(.equal)
        XCTAssertTrue(result == "7")
        viewModel.run(.clean)
    }
    func testMultiplication(){
        viewModel.run(.clean)
        viewModel.run(.nine)
        viewModel.run(.multiplication)
        viewModel.run(.two)
        viewModel.run(.equal)
        XCTAssertTrue(result == "18")
        viewModel.run(.equal)
        XCTAssertTrue(result == "36")
        viewModel.run(.clean)
    }
    func testDivision(){
        viewModel.run(.clean)
        viewModel.run(.nine)
        viewModel.run(.division)
        viewModel.run(.three)
        viewModel.run(.equal)
        XCTAssertTrue(result == "3")
        viewModel.run(.equal)
        XCTAssertTrue(result == "1")
        viewModel.run(.clean)
    }
    func testSign(){
        viewModel.run(.clean)
        viewModel.run(.seven)
        XCTAssertTrue(result == "7")
        viewModel.run(.sign)
        XCTAssertTrue(result == "-7")
        viewModel.run(.sign)
        XCTAssertTrue(result == "7")
        viewModel.run(.clean)
    }
    func testDot(){
        viewModel.run(.clean)
        viewModel.run(.one)
        viewModel.run(.dot)
        XCTAssertTrue(result == "1.")
        viewModel.run(.dot)
        XCTAssertTrue(result == "1.")
        viewModel.run(.clean)
    }
    func testPercentage() {
        viewModel.run(.clean)
        viewModel.run(.seven)
        viewModel.run(.percentage)
        XCTAssertTrue(result == "0.07")
        viewModel.run(.percentage)
        XCTAssertTrue(result == "0.0007")
    }

    
}
