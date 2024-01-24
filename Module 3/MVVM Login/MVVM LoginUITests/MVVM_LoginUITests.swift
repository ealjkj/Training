//
//  MVVM_LoginUITests.swift
//  MVVM LoginUITests
//
//  Created by intekglobal02 on 1/18/24.
//

import XCTest

final class MVVM_LoginUITests: XCTestCase {

    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_registrationFlow() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let gotToRegisterButton = app.buttons["Register"]
        XCTAssert(gotToRegisterButton.exists)
        
        gotToRegisterButton.tap()
        
        let nameTextfield = app.textFields["Name"]
        XCTAssert(nameTextfield.exists)
        nameTextfield.tap()
        nameTextfield.typeText("Jorge")
        
        let emailTextfield = app.textFields["Email"]
        XCTAssert(emailTextfield.exists)
        emailTextfield.tap()
        emailTextfield.typeText("a@a.com")
        
        let passwordTextfield = app.textFields["Password"]
        XCTAssert(passwordTextfield.exists)
        passwordTextfield.tap()
        passwordTextfield.typeText("123123123")
        
        let confirmPasswordTextfield = app.textFields["Confirm password"]
        XCTAssert(confirmPasswordTextfield.exists)
        
        confirmPasswordTextfield.tap()
        confirmPasswordTextfield.typeText("123123123")
        
        let registerButton = app.buttons["Register"]
        XCTAssert(registerButton.exists)
        
//        registerButton.tap()

    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
