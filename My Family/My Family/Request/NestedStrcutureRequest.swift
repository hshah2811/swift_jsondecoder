//
//  NestedStrcutureRequest.swift
//  My Family
//
//  Created by Shah, Harshit on 8/28/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
/* OUT PUT
 
 */
public protocol AddressRepresentable : Encodable
{
    var line1:String {get set}
}
open class ResidenceAddress : AddressRepresentable
{
    public var line1: String
    public init(addLine1:String)
    {
        line1 = addLine1
    }
}
open class NestedStrcutureRequest<ADDRESS:AddressRepresentable> : Encodable
{
    public let familyId:String
    public let noOfEarningMembers:Int
    public let totalIncome:Double
    public var residenceAddress:ADDRESS?
    public init(idValue:String,noOfEarningMembersValue:Int,totalIncomeValue:Double) {
        familyId = idValue
        noOfEarningMembers = noOfEarningMembersValue
        totalIncome = totalIncomeValue
    }
    enum CodingKeys : String, CodingKey {
        case familyId = "id"
        case incomeInfo
        case addressData
    }
    enum familyInfoCodingKeys : String, CodingKey {
        case noOfEarningMembers = "earningMemberCount"
        case totalIncome
    }
    public func encode(to encoder: Encoder) throws
    {
        var contatiner = encoder.container(keyedBy: CodingKeys.self)
        try contatiner.encode(familyId, forKey: NestedStrcutureRequest.CodingKeys.familyId)
        
        var familyInfo = contatiner.nestedContainer(keyedBy: familyInfoCodingKeys.self, forKey: NestedStrcutureRequest.CodingKeys.incomeInfo)
        try familyInfo.encode(totalIncome, forKey: NestedStrcutureRequest.familyInfoCodingKeys.totalIncome)
        try familyInfo.encode(noOfEarningMembers, forKey: NestedStrcutureRequest.familyInfoCodingKeys.noOfEarningMembers)
        if let address = residenceAddress
        {
            try contatiner.encode(address, forKey: NestedStrcutureRequest.CodingKeys.addressData)
        }

    }
}


