//
//  FamilyTests.swift
//  FamilyTests
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import XCTest
@testable import Family

class FamilyTests: XCTestCase {
    var bundle:Bundle!
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: type(of: self))
            
       
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPaymentCards() {
        
        guard let filePath = bundle.path(forResource: "CardTokenResponse", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        FamilyAPI(jsonFilePath: url).fetchFamilies(classType: GetCheckoutData.self) { (cardTokenData, error) in
            if let _ = error
            {
                XCTAssert(false)
            }
            else
            {
                print(cardTokenData)
                XCTAssert(true)
                
            }
        }
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
