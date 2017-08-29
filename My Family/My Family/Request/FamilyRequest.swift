//
//  FamilyRequest.swift
//  My Family
//
//  Created by Shah, Harshit on 8/24/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
public protocol requestEncodable: Encodable
{
    
}
/* OUT PUT
{
    "id" : "12312312312",
    "incomeInfo" : {
        "totalIncome" : 10000,
        "earningMemberCount" : 10
    }
}
*/
public struct FamilyRequest : requestEncodable
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
        case familyId = "id"
        case incomeInfo
    }
    enum IncomeCodingKeys : String, CodingKey {
        case noOfEarningMembers = "earningMemberCount"
        case totalIncome
    }
    public func encode(to encoder: Encoder) throws
    {
        var contatiner = encoder.container(keyedBy: CodingKeys.self)
        try contatiner.encode(familyId, forKey: FamilyRequest.CodingKeys.familyId)
        
        var incomeInfo = contatiner.nestedContainer(keyedBy: IncomeCodingKeys.self, forKey: FamilyRequest.CodingKeys.incomeInfo)
        try incomeInfo.encode(totalIncome, forKey: FamilyRequest.IncomeCodingKeys.totalIncome)
        try incomeInfo.encode(noOfEarningMembers, forKey: FamilyRequest.IncomeCodingKeys.noOfEarningMembers)
        
    }
}
