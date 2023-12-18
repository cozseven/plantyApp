//
//  DataProviderProtocol.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Alamofire

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    
    var baseUrl: String { get }
    
    func getData<T: RequestProtocol>(for request: T,
                                     result: DataProviderResult<T.ResponseType>?)
    
    
}
