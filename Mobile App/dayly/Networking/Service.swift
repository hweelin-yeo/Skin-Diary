//
//  Service.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 10/25/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

import Foundation

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

public enum api {}

extension api: EndPointType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://studio-esteelauder.herokuapp.com/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String { return String()}
    
    var httpMethod: HTTPMethod { return .get}
    
    var task: HTTPTask { return .request}
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
