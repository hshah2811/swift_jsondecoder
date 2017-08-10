//
//  Person.swift
//  Family
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
public protocol Printable
{
    func printData()
}
public protocol PersonRepresentable : Decodable, Printable
{
    
}
open class Person<T:MobileNumberRepresentable>: PersonRepresentable
{
    let name: String
    let age: Int
    var mobileNumber:[T]?
    enum PersonCodingKeys: String, CodingKey {
        case name
        case age
        case mobileNumber
    }
    public init(name:String,age:Int)
    {
        self.name = name
        self.age = age
    }
    public convenience init(name:String,age:Int,mobileNumber:[T]?)
    {
        self.init(name: name, age: age)
        self.mobileNumber = mobileNumber
    }
    open func printData() {
        print("Person " +
            "Name: \(name)   " +
            "Age: \(age)")
        let _ = mobileNumber?.map({ $0.printData() })
    }
    required public init(from decoder: Decoder) throws {
        print("Person decoder")
        let values = try decoder.container(keyedBy: PersonCodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(Int.self, forKey: .age)
        mobileNumber = try values.decodeIfPresent([T].self, forKey: .mobileNumber)
    }
}
