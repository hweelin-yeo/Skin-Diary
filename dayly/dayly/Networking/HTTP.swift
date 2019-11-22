//
//  HTTP.swift
//  Mobile App
//
//  Created by Yeo Hwee Lin on 10/25/19.
//  Copyright © 2019 Yeo Hwee Lin. All rights reserved.
//

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum HTTPTask {
    case request
    case requestParameters(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestParametersAndHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter Encoding failed"
    case missingURL = "URL is missing"
}
