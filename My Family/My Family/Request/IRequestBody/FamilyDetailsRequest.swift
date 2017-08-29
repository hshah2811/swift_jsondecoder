//
//  FamilyDetailsRequest.swift
//  My Family
//
//  Created by Shah, Harshit on 8/29/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
import Family
class FamilyDetailRequest : IRequestBody
{
    private var bodyValue: Encodable
    public init()
    {
        bodyValue = FamilyRequest(idValue: "111111", noOfEarningMembersValue: 10, totalIncomeValue: 1231231)
    }
    var encodableBody: Encodable {
        get
        {
            return bodyValue
        }
        set(newValue)
        {
           bodyValue = newValue
        }
    }
    
    
}
