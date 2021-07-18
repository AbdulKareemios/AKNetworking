//
//  NetworkSupport.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation


enum HTTPRequestType: String {

    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case PUT = "PUT"
}


enum StatusCode: Int {
    
    case notReachable = 504
    case success = 200
    case multipleResponse = 300
    case unAuthorized = 401
    case notFound = 404
    case serverError = 500
    case unprocessableEntry = 422
    case unknown = 0
}

public enum YourAppNameError: String, Error {
    
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response"
    case invalidParameters = "invalid parameters"
    case internetFailure = "The Internet connection appears to be offline."
    case serverError = "Server Could not be reached. \n Try Again"
    case unAuthorized = "Unauthorized access"
    case multipleResponse = "Multiple Response"
    case notFound = "Not Found"
    case notReachable = "Not Reachable"
    case success = "Success"
    case unknown = "Unknown"
    case unProcessableEntry = "UnProcessable Entry"
    case accessTokenMissing = "Access Token Missing"
    
     static func getError(statusCode: Int) -> YourAppNameError {
        
        switch statusCode {
        case StatusCode.multipleResponse.rawValue:
            return .multipleResponse
        case StatusCode.unAuthorized.rawValue:
            return .unAuthorized
        case StatusCode.notFound.rawValue:
            return .notFound
        case StatusCode.serverError.rawValue:
            return .serverError
        case StatusCode.unprocessableEntry.rawValue:
            return .unProcessableEntry
        default:
            return .unknown
        }
    }
}

enum AuthenticationKey: String {
    
    case googleMapKey = "YOUR-GOOGLE-MAP-KEY"
    case appSecretKey = "YOUR-APP-SECRET-KEY"
    case stripePublishableKey = "KEY"
}

enum API: String {
  
    case baseURL = "https://your.base.url.com"
    case signUp = "/api/user/signup"
    case login = "/api/user/oauth/token"
    case googleLogin = "/api/user/auth/google"
    case facebookLogin = "/api/user/auth/facebook"
    case getProfile = "/api/user/details"
    case updateProfile = "/api/user/update/profile"
    case resetPassword = "/api/user/reset/password"
    case changePassword = "/api/user/change/password"
    case forgotPassword = "/api/user/forgot/password"
    case googleMaps = "https://maps.googleapis.com/maps/api/geocode/json"
    case servicesList = "/api/user/services"
    
}

struct WebConstants {

    static let string = WebConstants()
    
    let post = "POST"
    let secretKey = "secretKey"
    let X_Requested_With = "X-Requested-With"
    let XMLHttpRequest = "XMLHttpRequest"
    let Content_Type = "Content-Type"
    let application_json = "application/json"
    let multipartFormData = "multipart/form-data"
    let Authorization = "Authorization"
    let access_token = "access_token"
    let CFBundleShortVersionString = "CFBundleShortVersionString"
    let password = "password"
    let bearer = "Bearer "
    let picture = "picture"
    let http = "http"
}


enum DeviceType : String, Codable {
    
    case ios = "ios"
}

