//
//  UserAuthenticationService.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation
import Alamofire
import SwiftyJSON


class UserAuthenticationServices: NetworkManager {
    
    static func loginWithUser(loginRequest: LoginRequest, completed: @escaping (Result<LoginResponse, YourAppNameError>) -> ()) {
        
    sharedNetwork.requestWithAPI(api: .login, httpMethod: .post, parameters: loginRequest.JSONRepresentation) { loginResponse in
        
        switch loginResponse {
                
            case .success(let data):
                guard let login = data.getDecodedObject(from: LoginResponse.self) else {
                    completed(.failure(.invalidResponse))
                    return
                }
                completed(.success(login))
                sharedData.loginResponse = login
                break
            case .failure(let error):
                print(error: error, functionName: #function)
                completed(.failure(error))
                break
            }
        }
    }
}

