//
//  NetworkManager.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 11/7/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import Foundation

struct NetworkManager {
    private let router = Router<api>()
    
    enum NetworkResponse: String {
        case success
        case authenticationError = "You need to be authenticated"
        case badRequest = "Bad Request"
        case outdated = "URL is outdated"
        case failed = "Network request failed"
        case noData = "Response returned with no data to decode"
        case unableToDecode = "We could not decpde the response"
    }
    
    enum Result<String> {
        case success
        case failure(String)
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
