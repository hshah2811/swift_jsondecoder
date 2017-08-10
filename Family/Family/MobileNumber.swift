//
//  MobileNumber.swift
//  Family
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
public protocol MobileNumberRepresentable : Decodable, Printable
{
    
}
open class MobileNumber : MobileNumberRepresentable
{
    let countryCode: String
    let number: Int
    public init(countryCode:String,number:Int)
    {
        self.countryCode = countryCode
        self.number = number
    }
    open func printData() {
        print("MobileNumber " +
            "\(countryCode)   " +
            "\(number)")
    }
}
