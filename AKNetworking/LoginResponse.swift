//
//  LoginResponse.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation


struct LoginResponse: Codable {
    
    var tokenType: String
    var expiresIn: Int
    var accessToken: String
    var refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
