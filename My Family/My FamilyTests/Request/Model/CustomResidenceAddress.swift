//
//  CustomResidenceAddress.swift
//  My FamilyTests
//
//  Created by Shah, Harshit on 8/28/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
@testable import My_Family
class CustomResidenceAddress : ResidenceAddress
{
    let pinCode:Int
    public init(pinCodeValue:Int,line1:String)
    {
        pinCode = pinCodeValue
      super.init(addLine1: line1)
    }
    private enum CodingKeys : String, CodingKey {
        case pinCode
    }
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(pinCode, forKey: CustomResidenceAddress.CodingKeys.pinCode)
        try super.encode(to: encoder)
        
    }
}
