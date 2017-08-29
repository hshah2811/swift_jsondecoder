//
//  FamilyAPI.swift
//  Family
//
//  Created by Shah, Harshit on 8/10/17.
//  Copyright © 2017 Harshit. All rights reserved.
//

import Foundation

public struct FamilyAPI
{
    var responseJSONFilePath:URL
    let jsonDecoder:JSONDecoder
    public init(jsonFilePath:URL, decoder:JSONDecoder = JSONDecoder())
    {
        responseJSONFilePath = jsonFilePath
        jsonDecoder = decoder
    }
    public func fetchFamilyByRequest<request:Encodable,Response:Decodable>(classType:Response.Type, request:request? = nil, completionHandler: @escaping (_ families:Response?,_ error:Error?) -> ())
    {
        if let requestToSend = request
        {
            let encoder = JSONEncoder()
            var jsonData:Data?
            do {
                encoder.outputFormatting = .prettyPrinted
                jsonData = try encoder.encode(requestToSend)
                print(String(data: jsonData!, encoding: .utf8)!)
            }
            catch let error
            {
                completionHandler(nil, error)
                return
            }
        }
        self.fetchFamilies(classType: classType, completionHandler: completionHandler)
    }
    public func fetchFamilies<T:Decodable>(classType:T.Type,completionHandler: @escaping (_ families:T?,_ error:Error?) -> ())
    {
        let responseData = FamilyAPI.getResponseJSONData(filePath: responseJSONFilePath)
        guard let jsonData = responseData.0 else
        {
            completionHandler(nil, responseData.1)
            return
        }
        
        
        print("classType \(classType)")
        var decodedFamily: T?
        do
        {
            decodedFamily = try jsonDecoder.decode(classType, from: jsonData)
        }
        catch let error
        {
            completionHandler(nil, error)
            return
        }
        completionHandler(decodedFamily, nil)
        return
    }
}

extension FamilyAPI
{
    private static func getResponseJSONData(filePath:URL) -> (Data?,Error?)
    {
        
        var successData:Data?
        
        do
        {
            successData = try Data(contentsOf: filePath)
            
            return (successData,nil)
        }
        catch let error
        {
            return (nil,error)
        }
        
    }
    
}

