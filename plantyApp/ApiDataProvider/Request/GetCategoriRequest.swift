//
//  GetCategoriRequest.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Alamofire

public struct GetCategoriRequest: RequestProtocol {
    
    public typealias ResponseType = CategoryData
    
    public var path: String = "/getCategories"
    public var method: HTTPMethod = .get
    public var parameters: Parameters = [:]
}
