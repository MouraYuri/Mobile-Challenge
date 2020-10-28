//
//  HeaderViewTests.swift
//  iOS-ChallengeTests
//
//  Created by Yuri Moura on 27/10/20.
//

import XCTest
@testable import iOS_Challenge

class HeaderViewTests: XCTestCase {
    
    var sut: HeaderHomeView!
    
    override func setUp() {
        sut = HeaderHomeView()
    }
    
    override func tearDown() {
        sut = nil
    }

    func testWelcomeTestForUsername() {
        let username = "Fernando"
        let welcomeText = sut.getWelcomeTextForUsername(username)
        
        XCTAssertEqual(welcomeText, "Olá, \(username)")
    }

}
