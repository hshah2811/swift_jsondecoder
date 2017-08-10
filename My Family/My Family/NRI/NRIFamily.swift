//
//  NRIFamily.swift
//  TestApp
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
import Family
public final class NRIFamily<T:NRIPerson>: Family<T>
{
    let livingCountry:String
    private enum NRICodingKeys: String, CodingKey {
        case livingCountry = "current_Country"
    }
    override public func printData() {
        super.printData()
        print("livingCountry \(self.livingCountry)")
    }
    public required init(livingCountry:String,familyName: String, members: [T]?)
    {
        self.livingCountry = livingCountry
        super.init(familyName: familyName, members: members)

    }
    public required init(from decoder: Decoder) throws {
        print("NRIFamily decoder")

        let values = try decoder.container(keyedBy: NRICodingKeys.self)
        livingCountry = try values.decode(String.self, forKey: .livingCountry)
        try super.init(from: decoder)
    }

}
