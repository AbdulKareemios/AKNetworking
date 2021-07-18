//
//  Network.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Alamofire
import SwiftyJSON
let sharedNetwork = NetworkManager.networkManager



class NetworkManager {
    
    static let networkManager = NetworkManager()
    let reachabilityManager = NetworkReachabilityManager()
    public var isReachable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    
    func requestWithAPI(api: API, requestObject: JSONSerializable? = nil, httpMethod: HTTPMethod = .get, parameters: Parameters = [:], headers: HTTPHeaders = [:], encoding: ParameterEncoding = URLEncoding.default, body: String = "", completed: @escaping (Result<Data, YourAppNameError>) -> ()) {
        
        guard isReachable else {
            #warning("Your app name warning: handle internet connection message")
            completed(.failure(.internetFailure))
            return
        }
        
    
        //Setup Headers
        var httpHeaders = headers
        let requestHeader = HTTPHeader(name: "X-Requested-With", value: "XMLHttpRequest")
        //let contentHeader = HTTPHeader(name: "Content-Type", value: "multipart/form-data")
        
        if api != .login && api != .signUp {
            guard let loginResponse = sharedData.loginResponse else {
                completed(.failure(.accessTokenMissing))
                return
            }
            let bearerHeader = HTTPHeader(name: "Authorization", value: "Bearer \(loginResponse.accessToken)")
            httpHeaders.add(bearerHeader)
        }
        
        httpHeaders.add(requestHeader)

        let requestURL = API.baseURL.rawValue + api.rawValue
        
        AF.request(requestURL, method: httpMethod, parameters: parameters, headers: httpHeaders).responseJSON { responseData in
            
            switch responseData.result {
            
            case .success(let dictionary):
                
                guard let response = responseData.response else {return}
                
                switch response.statusCode {
                case StatusCode.success.rawValue:
                    do {
                      let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
                        completed(.success(data))
                    } catch let error {
                        print(error: error, functionName: #function)
                    }
                    break
                default:
                    let YourAppNameError = YourAppNameError.getError(statusCode: response.statusCode)
                    completed(.failure(YourAppNameError))
                    break
                }
                break
            case .failure(let error):
                
                let statusCode = (responseData.response != nil) ? responseData.response!.statusCode : (error.responseCode ?? StatusCode.unknown.rawValue)
                
                let YourAppNameError = YourAppNameError.getError(statusCode: statusCode)
                completed(.failure(YourAppNameError))
                print(error: error, functionName: #function)
                break
            }
        }
    }
}


