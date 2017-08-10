//
//  My_FamilyTests.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import XCTest
import Family
@testable import My_Family

class My_FamilyTests: XCTestCase {
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

    func testFamilyAPI_KHAN_FAMILY_WithMobileNumber() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilies(classType: personType) { (family, error) in

            if let err = error{
                XCTFail("Error: \(String(describing: err))")
            }

            var familyDetails = false
            if let family = family
            {
                family.printData()
                familyDetails = true
            }
            XCTAssert(familyDetails)
        }
    }
    
    func testFamilyAPI_KHAN_Family_WithoutMobileNumber() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithoutMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }

        let url = URL(fileURLWithPath: filePath)
   

        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilies(classType: personType) { (family, error) in

            if let err = error{
                XCTFail("Error: \(String(describing: err))")
            }

            var familyDetails = false
            if let family = family
            {
                family.printData()
                familyDetails = true
            }
            XCTAssert(familyDetails)

        }
    }
    
    func testFamilyAPI_NRIFamily_CategorizedMobileNumber() {
        guard let filePath = bundle.path(forResource: "NRI_KHAN_FAMILY_MigrationDate_CategorizedMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let personType = NRIFamily.self
        FamilyAPI(jsonFilePath: url, decoder: decoder).fetchFamilies(classType: personType) { (nriFamily, error) in
            
            if let err = error{
                XCTFail("Error: \(String(describing: err))")
            }
            
            var familyDetails = false
            if let family = nriFamily
            {
                family.printData()
                familyDetails = true
            }
            XCTAssert(familyDetails)
            
        }
    }
    func testFamilyAPI_IndianFamily_CategorizedMobileNumber() {
        guard let filePath = bundle.path(forResource: "INDIAN_KHAN_CustomizedMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let personType = Family<Person<CategorizedMobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilies(classType: personType) { (indainFamily, error) in
            
            if let err = error{
                XCTFail("Error: \(String(describing: err))")
            }
            
            var familyDetails = false
            if let family = indainFamily
            {
                family.printData()
                familyDetails = true
            }
            XCTAssert(familyDetails)
            
        }
    }
    
}
