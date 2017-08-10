//
//  CategorizedMobileNumber.swift
//  TestApp
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
import Family

public enum NumberCategory:String
{
    case HOME
    case WORK
}
public class CategorizedMobileNumber : MobileNumber
{
    var category:NumberCategory?
    
    override public func printData() {
        super.printData()
        print("category \(String(describing: self.category))")
    }
    private enum NumberCategoryCodingKeys: String, CodingKey {
        case category
    }

    
    required public init(from decoder: Decoder) throws {
        print("CategorizedMobileNumber decoder")

        let values = try decoder.container(keyedBy: NumberCategoryCodingKeys.self)
        if let numberCategory = try values.decodeIfPresent(String.self, forKey: CategorizedMobileNumber.NumberCategoryCodingKeys.category)
        {
            category = NumberCategory(rawValue: numberCategory)
        }
        try super.init(from: decoder)
    }
}
