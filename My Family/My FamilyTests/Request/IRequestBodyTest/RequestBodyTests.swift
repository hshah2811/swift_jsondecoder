//
//  RequestBodyTests.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/29/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
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
class RequestBodyTests: XCTestCase {
    var bundle:Bundle!
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: type(of: self))
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func test_KHAN_FAMILY_Request_Response() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let request  = FamilyRequest(idValue: "12312312312", noOfEarningMembersValue: 10, totalIncomeValue: 10000)
        let requestBody = FamilyDetailRequest()
        let personType = Family<Person<MobileNumber>>.self
        var familyAPI = FamilyAPI(jsonFilePath: url)
         familyAPI.encodableRequestBody = requestBody
        familyAPI.fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            
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
    
}

