//
//  Services.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import Foundation

enum RequestMethod: String {
    case get = "GET"
}


class Services {
    
    static let shared = Services()
    
    private init() {}
    
    func makeRequest(to url: String, method: RequestMethod, completion: @escaping ([String:Any]?, String?) -> Void ) {
        guard let parsedURL = URL(string: url) else {
            return
        }
        
        var request = URLRequest(url: parsedURL)
        
        request.httpMethod = method
        
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { (response, data, error) in
            
            guard let _ = error else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        print(json)
                    }
                } catch let error as NSError {
                    print("Unable to load data")
                }
                return
            }
        }
        
        
    }
    
    
}
