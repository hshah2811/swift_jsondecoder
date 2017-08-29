//
//  CustomNestedRequest.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/28/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
@testable import My_Family
class  CustomNestedRequest<ADDRESS:AddressRepresentable>: NestedStrcutureRequest<ADDRESS> {
    let cast:String
    public  init(castValue:String,idValue: String, noOfEarningMembersValue: Int, totalIncomeValue: Double) {
        self.cast = castValue
        super.init(idValue: idValue, noOfEarningMembersValue: noOfEarningMembersValue, totalIncomeValue: totalIncomeValue)
    }
    private enum CustomCodingKeys:String, CodingKey
    {
        case cast = "family_cast"
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CustomCodingKeys.self)
        try container.encode(cast, forKey: CustomCodingKeys.cast)
        try super.encode(to: encoder)
    }
}
