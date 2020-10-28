//
//  Services.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
}

class Services {
    
    static let shared = Services()
    
    private init() {}
    
    func makeRequest(to url: String, method: RequestMethod, completion: @escaping ([String:Any]?, String?) -> Void ) {
        
        guard let parsedURL = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: parsedURL)
        let session = URLSession.shared
        request.httpMethod = method.rawValue
        
        
        session.dataTask(with: request) { (data, response, error) in
            guard let _ = error else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        completion(json, nil)
                    }
                } catch _ as NSError {
                    print("Unable to load data")
                }
                return
            }
            completion(nil, error.debugDescription)
            return
        }.resume()
        
        request.httpMethod = method.rawValue
    }
}
