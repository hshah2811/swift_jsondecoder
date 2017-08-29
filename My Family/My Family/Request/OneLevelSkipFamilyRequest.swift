//
//  OneLevelSkipFamilyRequest.swift
//  My Family
//
//  Created by Shah, Harshit on 8/28/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
/* OUT PUT
{
    "Request" : {
        "id" : "433434343",
        "totalIncome" : 1231231,
        "earningMemberCount" : 10
    }
}
*/
public enum RequestValidationError : Error
{
    case invalidValue(value:String)
    case valueMissing(value:String)
}
public struct OneLevelSkipFamilyRequest : Encodable
{
    let familyId:String
    let noOfEarningMembers:Int
    let totalIncome:Double
    public init(idValue:String,noOfEarningMembersValue:Int,totalIncomeValue:Double) {
        familyId = idValue
        noOfEarningMembers = noOfEarningMembersValue
        totalIncome = totalIncomeValue
    }
    enum CodingKeys : String, CodingKey {
        case Request
    }
    enum FamilyRequestKeys : String, CodingKey {
        case familyId = "id"
        case noOfEarningMembers = "earningMemberCount"
        case totalIncome
    }
    public func encode(to encoder: Encoder) throws
    {
        var contatiner = encoder.container(keyedBy: CodingKeys.self)
        var familyInfo = contatiner.nestedContainer(keyedBy: FamilyRequestKeys.self, forKey: OneLevelSkipFamilyRequest.CodingKeys.Request)
        guard familyId.count > 2 else
        {
            throw RequestValidationError.invalidValue(value: "familyId")
        }
        try familyInfo.encode(familyId, forKey: OneLevelSkipFamilyRequest.FamilyRequestKeys.familyId)
        try familyInfo.encode(totalIncome, forKey: OneLevelSkipFamilyRequest.FamilyRequestKeys.totalIncome)
        try familyInfo.encode(noOfEarningMembers, forKey: OneLevelSkipFamilyRequest.FamilyRequestKeys.noOfEarningMembers)
        
    }
}
