//
//  GetQuestionsRequest.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Alamofire

public struct GetQuestionsRequest: RequestProtocol {
    
    public typealias ResponseType = [Questions]
    
    public var path: String = "/getQuestions"
    public var method: HTTPMethod = .get
    public var parameters: Parameters = [:]
}
