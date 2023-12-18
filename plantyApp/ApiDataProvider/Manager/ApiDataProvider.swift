//
//  ApiDataProvider.swift
//  plantyApp
//
//  Created by Can Özseven on 17.12.2023.
//

import Alamofire

public struct ApiDataProvider: DataProviderProtocol {
    
    public init() {}
    
    public var baseUrl: String {
        return "https://dummy-api-jtg6bessta-ey.a.run.app"
    }
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        print("Request Url: \(baseUrl + request.path)")
        print("Request Method: \(request.method.rawValue)")
        print("Request Parameters: \(request.parameters)")
        
        let request = AF.request(baseUrl + request.path,
                                 method: request.method,
                                 parameters: request.parameters,
                                 encoding: request.encoding)
        request.validate()
        request.responseData { (response) in
            if let value = response.value {
                if let json = String(data: value, encoding: .utf8) {
                    print("Response JSON: \n\(json)")
                }
            }
        }
        return request
    }
    
    public func getData<T: RequestProtocol>(for request: T, result: DataProviderResult<T.ResponseType>?) {
        let request = createRequest(request)
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            if let value = response.value {
                result?(.success(value))
            } else {
                self.handleFailure(response: response, result: result)
            }
        }
    }
    
    private func handleFailure<T: Decodable>(response: DataResponse<T, AFError>, result: DataProviderResult<T>?) {
        if let data = response.data {
            if let json = String(data: data, encoding: .utf8) {
                print("Response JSON: \(json)")
            }
        }
    }
}
