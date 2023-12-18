//
//  RequestProtocol.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Alamofire

public protocol RequestProtocol {
    
    associatedtype ResponseType: Decodable
            
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters { get }
    var encoding: ParameterEncoding { get }
    
}

public extension RequestProtocol {
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
}
