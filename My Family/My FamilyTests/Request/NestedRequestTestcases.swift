//
//  NestedRequestTestcases.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/28/17.
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
class NestedRequestTestcases: XCTestCase {
    var bundle:Bundle!
    override func setUp() {
        super.setUp()
        bundle = Bundle(for: type(of: self))
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test_KHAN_FAMILY_Nested_Request_Test() {
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        let address = ResidenceAddress(addLine1: "1212312")
        let request = NestedStrcutureRequest<ResidenceAddress>(idValue: "123123", noOfEarningMembersValue: 10, totalIncomeValue: 20222)
        request.residenceAddress = address
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            print(error?.localizedDescription)
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

    func test_KHAN_FAMILY_Nested_Custom_Request_Test() {
        
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        /*
         {
         "id" : "123123",
         "incomeInfo" : {
         "totalIncome" : 20222,
         "earningMemberCount" : 10
         },
         "addressData" : {
         "pinCode" : 39002,
         "line1" : "main road"
         }
         }
         */
        let customAddress =  CustomResidenceAddress(pinCodeValue: 39002, line1: "main road").self
        let request = NestedStrcutureRequest<CustomResidenceAddress>(idValue: "123123", noOfEarningMembersValue: 10, totalIncomeValue: 20222)
        request.residenceAddress = customAddress
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            print(error?.localizedDescription)
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
    func test_KHAN_FAMILY_Nested_Custom_Request_Test2() {
        
        guard let filePath = bundle.path(forResource: "KHAN_FAMILY_WithMobileNumber", ofType: "json") else
        {
            XCTFail("FilePathNotFound")
            return
        }
        
        let url = URL(fileURLWithPath: filePath)
        /*
         {
         "id" : "12312312",
         "family_cast" : "Hindu",
         "incomeInfo" : {
         "totalIncome" : 12321323,
         "earningMemberCount" : 10
         },
         "addressData" : {
         "pinCode" : 39002,
         "line1" : "main road"
         }
         }
         */
        let customAddress =  CustomResidenceAddress(pinCodeValue: 39002, line1: "main road").self
        let request = CustomNestedRequest<CustomResidenceAddress>(castValue: "Hindu", idValue: "12312312", noOfEarningMembersValue: 10, totalIncomeValue: 12321323)
//        let request = NestedStrcutureRequest<CustomResidenceAddress>(idValue: "123123", noOfEarningMembersValue: 10, totalIncomeValue: 20222)
        request.residenceAddress = customAddress
        let personType = Family<Person<MobileNumber>>.self
        FamilyAPI(jsonFilePath: url).fetchFamilyByRequest(classType: personType, request: request) { (family, error) in
            print(error?.localizedDescription)
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
