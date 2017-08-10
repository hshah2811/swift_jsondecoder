//
//  NRIPerson.swift
//  TestApp
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
import Family
public class NRIPerson : Person<CategorizedMobileNumber>
{
    //public typealias mobileNumberType = CategorizedMobileNumber
    var migrateDate:Date
    
    override public func printData() {
        super.printData()
        print("migrateDate \(self.migrateDate)")
    }
    private enum NRIPersonCodingKeys: String, CodingKey {
        case migrateDate
    }
    public required init(migrateDate:Date, name:String, age:Int)
    {
        self.migrateDate = migrateDate
        super.init(name: name, age: age)
    }
    
    required public init(from decoder: Decoder) throws {
        print("NRIPerson decoder")
        let values = try decoder.container(keyedBy: NRIPersonCodingKeys.self)
        migrateDate = try values.decode(Date.self, forKey: NRIPerson.NRIPersonCodingKeys.migrateDate)
        try super.init(from: decoder)
    }
}
