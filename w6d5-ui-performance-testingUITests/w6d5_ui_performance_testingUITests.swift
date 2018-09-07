//
//  w6d5_ui_performance_testingUITests.swift
//  w6d5-ui-performance-testingUITests
//
//  Created by Jamie on 2018-09-07.
//  Copyright © 2018 Roland. All rights reserved.
//

import XCTest

class w6d5_ui_performance_testingUITests: XCTestCase {
        let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        //let app = XCUIApplication()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_addMeal(burger: String, calories: Int) {
        
        
        let app = XCUIApplication()
        app.navigationBars["Master"].buttons["Add"].tap()
        
        let addAMealAlert = app.alerts["Add a Meal"]
        let collectionViewsQuery = addAMealAlert.collectionViews
        collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("Burger")
        
        let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText("300")
        addAMealAlert.buttons["Ok"].tap()
      
   

    
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testDeleteMeal(){
        
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Burger - 300"]/*[[".cells.staticTexts[\"Burger - 300\"]",".staticTexts[\"Burger - 300\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        
    }
    
}
