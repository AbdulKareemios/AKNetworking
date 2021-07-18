//
//  JsonSerializing.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation


protocol JSONSerializable : Codable {
    var JSONRepresentation : [String : Any] { get }
}

extension JSONSerializable {
    
    
    var JSONRepresentation : [String : Any] {
        
        var representation = [String:Any]()
        
        for case let (label?, value) in Mirror(reflecting: self).children {
            
            switch value {
            case let value as Dictionary<String,Any>:
                
                representation[label] = value as AnyObject
                
            case let value as Array<Any>:
                
                if let val = value as? [JSONSerializable]{
                    representation[label] = val.map({ $0.JSONRepresentation as AnyObject}) as AnyObject
                } else {
                    representation[label] = value as AnyObject
                }
                
            case let value as JSONSerializable:
                
                representation[label] = value.JSONRepresentation
                
            case let value as AnyObject :
                
                representation[label] = value
                
            default: break
            }
        }
        return representation
    }
    
    // Convert to data by Encoding
    
    func toData()->Data? {
        
        do {
           return try JSONEncoder().encode(self)
        } catch let err {
            print("Error in Encoding ", self.JSONRepresentation, err.localizedDescription)
            return nil
        }
    }
}

// MARK:- For Data

extension Data {
    
     func getDecodedObject<T>(from object : T.Type)->T? where T : Decodable {
        
        do {
            
            return try JSONDecoder().decode(object, from: self)
            
        } catch let error {
            
            print("Manually parsed  ", (try? JSONSerialization.jsonObject(with: self, options: .allowFragments)) ?? "nil")
            
            
            print(error: error, functionName: #function)
            return nil
        }
    }
}

extension Dictionary {
    
    func dataObject() -> Data? {
        
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
        
    }
}



