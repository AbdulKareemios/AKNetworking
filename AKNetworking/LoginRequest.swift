//
//  LoginRequest.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation

struct LoginRequest: JSONSerializable {
    
    var username : String?
    var password : String?
    var grant_type : String? = "password"
    var client_id : Int = 2
    var client_secret : String? = AuthenticationKey.appSecretKey.rawValue
    var device_token : String? = "your device token"
    var device_id : String? = "your device id"
    var device_type : DeviceType? = .ios
}
