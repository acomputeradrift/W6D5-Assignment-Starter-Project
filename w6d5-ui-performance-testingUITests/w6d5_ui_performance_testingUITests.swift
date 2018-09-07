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
        deleteMeal(mealName:"Burger", numberOfCalories: 300)
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func addMeal(mealName:String, numberOfCalories:Int){
      
        
        app.navigationBars["Master"].buttons["Add"].tap()
        
        let addAMealAlert = app.alerts["Add a Meal"]
        let collectionViewsQuery = addAMealAlert.collectionViews
        collectionViewsQuery.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("\(mealName)")
        
        let textField = collectionViewsQuery.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText("\(numberOfCalories)")
        addAMealAlert.buttons["Ok"].tap()
    }
    
    func deleteMeal(mealName:String, numberOfCalories:Int){
        let staticText = app.tables.staticTexts["\(mealName) - \(numberOfCalories)"]
        if staticText.exists{
            let tablesQuery = XCUIApplication().tables
            tablesQuery.staticTexts["\(mealName) - \(numberOfCalories)"].swipeLeft()
            tablesQuery.buttons["Delete"].tap()
        }
    }
    func showMealDetails(mealName:String, numberOfCalories:Int){
        XCUIApplication().tables.staticTexts["\(mealName) - \(numberOfCalories)"].tap()
    }

    
    func test_addMeal(){
    addMeal(mealName:"Burger", numberOfCalories: 300)
    }
    
        func test_DeleteMeal(){
    deleteMeal(mealName:"Burger", numberOfCalories: 300)
    }
    
    func test_showMealDetails(){
    addMeal(mealName:"Burger", numberOfCalories: 300)
    showMealDetails(mealName: "Burger", numberOfCalories: 300)
    XCTAssert(app.staticTexts["detailViewControllerLabel"].identifier == "detailViewControllerLabel", "Expected to be displaying detailViewControllerLabel")

    }
    
}
