//
//  ViewController.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendLoginRequest()
    }
    
    private func sendLoginRequest() {
        
        let loginRequest = LoginRequest(username: "username", password: "password")
        UserAuthenticationServices.loginWithUser(loginRequest: loginRequest) { result in
            
            switch result {
            case .failure(let error):
                print(error: error, functionName: #function)
                break
            case .success(let loginResponse):
                print(loginResponse)
                break
            }
        }
    }
}

