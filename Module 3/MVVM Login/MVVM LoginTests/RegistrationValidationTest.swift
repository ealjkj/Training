//
//  MVVM_LoginTests.swift
//  MVVM LoginTests
//
//  Created by intekglobal02 on 1/18/24.
//

import XCTest
@testable import MVVM_Login

final class RegistrationValidationTest: XCTestCase {
    let validationService = RegistrationValidation()
    
    func test_empty_name_shouldFail() throws {
        let request = RegistrationRequest(name: "", email: "a@a.co", password: "123123123", passwordConfirmation: "123123123")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertFalse(validation.success)
        XCTAssertEqual(validation.errorMessage, "Invalid name")
    }
    
    
    func test_passwords_withLessThan_8Characters_shouldFail()  {
        let request = RegistrationRequest(name: "Jorge", email: "a@a.co", password: "1234567", passwordConfirmation: "1234567")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertFalse(validation.success)
        XCTAssertEqual(validation.errorMessage, "Invalid password")
    }
    
    func test_valid_requests_should_be_successful() throws {
        let request = RegistrationRequest(name: "Jorge", email: "a@a.cc", password: "12345678", passwordConfirmation: "12345678")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertTrue(validation.success)
        XCTAssertNil(validation.errorMessage)
    }
        
    
    func test_emails_shouldNotStart_withADot() throws {
        let request = RegistrationRequest(name: "Jorge", email: ".abc@mail.com", password: "12345678", passwordConfirmation: "12345678")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertFalse(validation.success)
        XCTAssertEqual(validation.errorMessage, "Invalid email")
    }
    
    func test_emails_shouldNot_containInvalidCharacters() {
        let request = RegistrationRequest(name: "Jorge", email: "abc#def@mail.com", password: "12345678", passwordConfirmation: "12345678")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertFalse(validation.success)
        XCTAssertEqual(validation.errorMessage, "Invalid email")
    }
    
    func test_lastPortionOfTheDomain_should_contain2OrMoreCharacters() {
        let request = RegistrationRequest(name: "Jorge", email: "abc.def@mail.c", password: "12345678", passwordConfirmation: "12345678")
        validationService.registerRequest = request
        let validation = validationService.validate()
        
        XCTAssertFalse(validation.success)
        XCTAssertEqual(validation.errorMessage, "Invalid email")
    }
}
