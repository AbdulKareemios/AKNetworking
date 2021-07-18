//
//  DataManager.swift
//  AbdulNetworking
//
//  Created by Abdul Kareem on 18/07/2021.
//

import Foundation

let sharedData = Datamanager.sharedDataManager
class Datamanager {
    static let sharedDataManager = Datamanager()
    
    var loginResponse: LoginResponse?
    
}
