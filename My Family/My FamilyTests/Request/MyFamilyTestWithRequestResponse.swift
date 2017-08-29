//
//  MyFamilyTestWithRequestResponse.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/21/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import XCTest
import Family
@testable import My_Family

//struct KHAN_FAMILY_Request : Encodable
//{
//    let familyId:String
//    init(idValue:String) {
//        familyId = idValue
//    }
//}
class MyFamilyTestWithRequestResponse: XCTestCase {
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
    
    func test_KHAN_FAMILY_Request_Response() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let request  = FamilyRequest(idValue: "12312312312", noOfEarningMembersValue: 10, totalIncomeValue: 10000)
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            
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
    
    func test_KHAN_FAMILY_OneLevelSkipRequest_Response() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let request = OneLevelSkipFamilyRequest(idValue: "433434343", noOfEarningMembersValue: 10, totalIncomeValue: 1231231)
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            
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
    
    func test_KHAN_FAMILY_INVALID_REQUEST_VALUE() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let request = OneLevelSkipFamilyRequest(idValue: "42", noOfEarningMembersValue: 10, totalIncomeValue: 1231231)
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            print(error?.localizedDescription)
            guard let expectedError = (error as? RequestValidationError) else
            {
                XCTFail("Error: \(String(describing: error))")
                return
            }
            
            if case .invalidValue(let field) = expectedError
            {
                print(field)
                XCTAssert(true)
            }
            else
            {
                XCTAssert(false)
            }

        }
    }
}
