//
//  CalcDemoUITests.swift
//  CalcDemoUITests
//
//  Created by Mike Lai on 2019/4/15.
//  Copyright © 2019 Mike.Lai. All rights reserved.
//

import XCTest

class CalcDemoUITests: XCTestCase {

    var app : XCUIApplication = XCUIApplication()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        app.buttons["NumberOne"].tap()
        app.buttons["NumberTwo"].tap()
        app.buttons["NumberThree"].tap()
        app.buttons["Dot"].tap()
        app.buttons["NumberZero"].tap()
        
        app.buttons["Addition"].tap()
        
        app.buttons["NumberFour"].tap()
        app.buttons["NumberFive"].tap()
        app.buttons["NumberSix"].tap()
        app.buttons["Sign"].tap()
        
        app.buttons["Subtraction"].tap()
        
        app.buttons["NumberSeven"].tap()
        app.buttons["NumberEight"].tap()
        app.buttons["NumberNine"].tap()
        
        app.buttons["Equal"].tap()
        app.buttons["Clean"].tap()
        
        app.buttons["NumberNine"].tap()
        app.buttons["Multiplication"].tap()
        app.buttons["NumberNine"].tap()
        
        app.buttons["Division"].tap()
        app.buttons["NumberThree"].tap()
        app.buttons["Equal"].tap()
        
        app.buttons["Percentage"].tap()

        app.buttons["Clean"].tap()


    }

}
