//
//  MVVM_LoginTests.swift
//  MVVM LoginTests
//
//  Created by intekglobal02 on 1/18/24.
//

import XCTest
@testable import MVVM_Login

final class MVVM_LoginTests: XCTestCase {
    var viewModel : RegistrationViewModel?
    var registrationService : RegistrationMockService?
    var validationService: RegistrationValidation?
    
    override func setUp() {
        registrationService = RegistrationMockService(httpUtility: HttpUtility())
        validationService = RegistrationValidation()
        
        viewModel = RegistrationViewModel(registrationService: registrationService!, registrationValidation: validationService!)
    }

    override func tearDown() {
        registrationService = nil
        validationService = nil
        viewModel = nil
    }
    
    func test_success_registration() {
        let expectation = self.expectation(description: "ValidRequest_Returns_Response")
        
        let registrationRequest = RegistrationRequest(name: "Jorge", email: "a@a.com", password: "123123123", passwordConfirmation: "123123123")
        
        viewModel?.registrationRequest = registrationRequest
        
        viewModel?.signup { data in
            switch data {
            case .success(let response):
                XCTAssert(response.success!)
                XCTAssertNil(response.errorMessage)
            case .failure(let error):
                XCTAssertNil(error)
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
