//
//  HomeViewModelTest.swift
//  iOS-ChallengeTests
//
//  Created by Yuri Moura on 27/10/20.
//

import XCTest
@testable import iOS_Challenge

class HomeViewModelTest: XCTestCase {

    var sut: HomeViewModel!
    
    override func setUp() {
        sut = HomeViewModel()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testParseDictToSpotlight() {
        let dict1 = ["name":"spotlight name", "bannerURL":"spotlight url", "description":"spotlight description"]
        
        let dict2:[String:String] = [:]
        
        var spotlight = (sut.parseDictToSpotlights([dict1])).first
        
        XCTAssertEqual(spotlight?.name, "spotlight name")
        XCTAssertEqual(spotlight?.bannerURL, "spotlight url")
        XCTAssertEqual(spotlight?.description, "spotlight description")
        
        
        spotlight = (sut.parseDictToSpotlights([dict2])).first
        
        XCTAssertEqual(spotlight?.name, "Not Defined")
        XCTAssertEqual(spotlight?.bannerURL, "Not Defined")
        XCTAssertEqual(spotlight?.description, "Not Defined")
        
        
        let spotlights = sut.parseDictToSpotlights([])
        
        XCTAssertTrue(spotlights.isEmpty)
        
    }
    
    func testParseDictToProducts() {
        let dict1 = ["name":"product name", "imageURL":"product url", "description":"product description"]
        
        let dict2:[String:String] = [:]
        
        var product = (sut.parseDictToProducts([dict1])).first!
        
        XCTAssertEqual(product.name, "product name")
        XCTAssertEqual(product.bannerURL, "product url")
        XCTAssertEqual(product.description, "product description")
        
        
        product = (sut.parseDictToProducts([dict2])).first!
        
        XCTAssertEqual(product.name, "Not Defined")
        XCTAssertEqual(product.bannerURL, "Not Defined")
        XCTAssertEqual(product.description, "Not Defined")
        
        
        let products = sut.parseDictToSpotlights([])
        
        XCTAssertTrue(products.isEmpty)
    }
}
