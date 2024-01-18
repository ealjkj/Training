//
//  tasksTests.swift
//  tasksTests
//
//  Created by intekglobal02 on 1/17/24.
//

import XCTest
@testable import tasks

final class tasksTests: XCTestCase {
    let validator = Validator()
    
    
    func test_valid_emails_should_be_true() throws {
        XCTAssert(validator.validateEmail("a@a.cc"))
        XCTAssert(validator.validateEmail("abc-d@mail.com"))
        XCTAssert(validator.validateEmail("abc.def@mail.com"))
        XCTAssert(validator.validateEmail("abc_def@mail.com"))
        XCTAssert(validator.validateEmail("abc.def@mail-archive.com"))
    }
    
    func test_InvalidDomains_should_be_false() throws {
        let isValid = Validator().validateEmail("xxxx@yyyy.zzz")
        XCTAssertFalse(isValid)
    }
    
    func test_undescorePeriodsAndDashes_shouldBeFollowed_byOneOrMoreLetterOrNumbers() throws {
        XCTAssertFalse(validator.validateEmail("abc-@mail.com"))
        XCTAssertFalse(validator.validateEmail("abc..def@mail.com"))
        
    }
    
    func test_emails_shouldNotStart_withADot() throws {
        XCTAssertFalse(validator.validateEmail(".abc@mail.com"))
    }
    
    func test_emails_shouldNot_containInvalidCharacters() throws {
        XCTAssertFalse(validator.validateEmail("abc#def@mail.com"))
    }
    
    func test_lastPortionOfTheDomain_should_contain2OrMoreCharacters() throws {
        XCTAssertFalse(validator.validateEmail("abc.def@mail.c"))
    }
    
    func test_domain_shouldNot_ContainMoreThanOneDot() throws {
        XCTAssertFalse(validator.validateEmail("abc.def@mail..com"))
    }
    
    func test_domain_should_containADot() throws {
        XCTAssertFalse(validator.validateEmail("abc.def@mail"))
    }
    
    
    

}
