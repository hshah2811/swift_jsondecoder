//
//  Family.swift
//  Family
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
open class Family<T:PersonRepresentable>: Decodable, Printable
{
    let familyName: String
    var familyMembers: [T] = []
    enum CodingKeys: String, CodingKey {
        case familyName
        case familyMembers
    }
    public init(familyName:String, members:[T]?)
    {
        self.familyName = familyName
        if let _ = members
        {
            familyMembers.append(contentsOf: members!)
        }
    }
    open func printData() {
        print("FamilyName \(familyName)")
        let _ = familyMembers.map({ $0.printData()})
    }
    public required init(from decoder: Decoder) throws {
        print("Family decoder")
        let values = try decoder.container(keyedBy: CodingKeys.self)
        familyName = try values.decode(String.self, forKey: .familyName)
        familyMembers = try values.decode([T].self, forKey: .familyMembers)
    }
    
    
}
