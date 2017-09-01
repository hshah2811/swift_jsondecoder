//
//  GetCheckoutData.swift
//  FamilyTests
//
//  Created by Shah, Harshit on 9/1/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation
class GetCheckoutData : Decodable
{
    var paymentCards:[PaymentCard]?
    enum GetCheckoutDataKeys: String, CodingKey {
        case paymentCards
    }
    public required init(from decoder: Decoder) throws
    {
        
        let container = try decoder.container(keyedBy: GetCheckoutDataKeys.self)
        paymentCards =  try container.decode([PaymentCard].self, forKey: GetCheckoutDataKeys.paymentCards)
    }
}
