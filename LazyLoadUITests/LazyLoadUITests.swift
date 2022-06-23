//
//  LazyLoadUITests.swift
//  LazyLoadUITests
//
//  Created by Andronick Martusheff on 6/22/22.
//

import XCTest

class LazyLoadUITests: XCTestCase {
    
    override class func setUp() {
        XCUIApplication().launch()
    }

    func testLazyVStack() throws {
        
        // Instance of Lazy Load Page Object
        let lazyLoadPage = LazyLoadPage()
        
        // Check if #1 Exists
        XCTAssertTrue(lazyLoadPage.verifyCellExists(with: 1))
        
        // Check if #67 Exists (Unloaded)
        lazyLoadPage.verticalScrollView.swipeUpTo(element: lazyLoadPage.verticalCell67, maxAttempts: 20, velocity: 1000)
        XCTAssertTrue(lazyLoadPage.verticalCell67.exists)
        
        // Go to bottom of LazyVStack
        lazyLoadPage.btnDown.tap()
        
        // Check if #99 Exists
        XCTAssertTrue(lazyLoadPage.verifyCellExists(with: 99))
        
        // Check if #17 Exists (Unloaded)
        lazyLoadPage.verticalScrollView.swipeDownTo(element: lazyLoadPage.verticalCell17, maxAttempts: 20, velocity: 1000)
        XCTAssertTrue(lazyLoadPage.verticalCell17.exists)
        
        // Go to top of LazyVStack
        lazyLoadPage.btnUp.tap()
        
        // Check if #1 Exists
        XCTAssertTrue(lazyLoadPage.verifyCellExists(with: 1))
    }

}

class LazyLoadPage: BasePage {
    lazy var verticalScrollView = app.scrollViews["UIVerticalScrollView"]
    lazy var verticalCell17 = app.staticTexts["UICellVertical17"]
    lazy var verticalCell67 = app.staticTexts["UICellVertical67"]
    
    lazy var btnUp = app.buttons["Up"]
    lazy var btnDown = app.buttons["Down"]
    
    
    
    func verifyCellExists(with number: Int) -> Bool {
        return app.staticTexts[verticalCellID(with: number)].exists
    }
    
    func verticalCellID(with number: Int) -> String {
        return "UICellVertical\(number)"
    }
}

class BasePage {
    var app = XCUIApplication()
}




