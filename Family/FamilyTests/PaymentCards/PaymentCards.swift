//
//  PaymentCards.swift
//  FamilyTests
//
//  Created by Shah, Harshit on 9/1/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation

class PaymentCard : Decodable
{
    var availableTokenData:[CardTokenData]?
    enum PaymentCardsKeys: String, CodingKey {
        case cardTokenData
    }
    public required init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: PaymentCardsKeys.self)
        print(container.contains(.cardTokenData))
        availableTokenData = try container.decode([CardTokenData].self, forKey: PaymentCard.PaymentCardsKeys.cardTokenData)
        
//        let container = try decoder.container(keyedBy: PaymentCardsKeys.self)
//        print(container)
//        print(container.allKeys)
//        print(container.codingPath)
//        // reviewCount
//        print(container.contains(.paymentCards))
//        var reviewUnkeyedContainer = try container.nestedUnkeyedContainer(forKey: .paymentCards)
//        var reviewCountArray = [CardTokenData]()
//        while !reviewUnkeyedContainer.isAtEnd {
//            let cardData = try reviewUnkeyedContainer.decode(CardTokenData.self)
////            let reviewCountContainer = try reviewUnkeyedContainer.nestedContainer(keyedBy: CardTokenDataKeys.self)
//            reviewCountArray.append(cardData)
//        }
//        guard let reviewCount = reviewCountArray.first else {
//            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath + [PaymentCardsKeys.cardTokenData], debugDescription: "cardTokenData cannot be empty"))
//        }
//        self.availableTokenData = reviewCountArray
        
    }
}

struct CardTokenData : Decodable {
    var uniqueReference:String?
    public enum CardTokenDataKeys: String, CodingKey {
        case tokenUniqueReference
    }
    public init(from decoder: Decoder) throws
    {
        let container = try decoder.container(keyedBy: CardTokenDataKeys.self)
        print(container.allKeys)
        print(container.codingPath)
         print(container.contains(.tokenUniqueReference))
        uniqueReference = try container.decode(String.self, forKey: CardTokenDataKeys.tokenUniqueReference)
//        var reviewUnkeyedContainer = try container.nestedUnkeyedContainer(forKey: .cardTokenData)
//        print(reviewUnkeyedContainer.count)
//        uniqueReference = try container.decode(String.self, forKey: CardTokenData.CardTokenDataKeys.tokenUniqueReference)
    }
}
