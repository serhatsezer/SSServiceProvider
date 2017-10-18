//
//  ViewController.swift
//  NetworkingSample
//
//  Created by SerhatSezer on 18/10/2017.
//  Copyright © 2017 SerhatSezer. All rights reserved.
//

import UIKit

enum UserProvider: SSRequestRepresentable {
    typealias RequestParameters = [String: Any]
    typealias JSONBody = [String: Any]
    
    var baseURL: URL {
        return URL(string: "http://sample.com")!
    }
    
    var parameters: RequestParameters {
        let params: [String: Any] = ["API_TOKEN": "123123123",
                                     "USER_ID": 3434,
                                     "TIME_STAMP": "12042017"]
        return params
    }
    
    var bodyData: JSONBody {
        let bodyDict: [String: Any] = ["API_TOKEN": "123123123",
                                       "USER_ID": 3434,
                                       "TIME_STAMP": "12042017"]
        return bodyDict
    }
    
    case getUser(name: String)
    case getAllUser
    case updateUser(id: String)
    case reportUser(id: String)
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let provider = SSProvider<UserProvider>()
        provider.request(.getUser(name: "Serhat")) { (response, error) in
            if let response = response {
                print("result \(response.result)")
            }
        }
    }
}

