//
//  ViewController.swift
//  NetworkingSample
//
//  Created by SerhatSezer on 18/10/2017.
//  Copyright © 2017 SerhatSezer. All rights reserved.
//

import Foundation

public enum SSError {
    case error(description: String)
    case internetConnectionError
}

public protocol SSRequestRepresentable {
    typealias RequestParameters = [String: Any]
    typealias JSONBody = [String: Any]
    
    var baseURL: URL { get }
    var parameters: RequestParameters { get }
    var bodyData: JSONBody { get }
}

public protocol SSResponseRepresentable {
    typealias JSON = [String: Any]
    var result: JSON { get set }
}

fileprivate struct Response: SSResponseRepresentable {
    var result: SSResponseRepresentable.JSON = ["users": ["id": 1232, "name": "Serhat", "email": "serhat@gmail.com"]]
}

public struct SSProvider<T: SSRequestRepresentable> {
    func request(_ provider: T, _ completion: (_ data: SSResponseRepresentable?, _ error: SSError?) -> ()) {
        let stubResponse = Response()
        completion(stubResponse, nil)
    }
}
