//
//  Product.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import Foundation
struct Product {
    let name: String
    let bannerURL: String
    let description: String
    
    init(_ dict: [String:Any]) {
        self.name = dict["name"] as? String ?? "Not Defined"
        self.bannerURL = dict["imageURL"] as? String ?? "Not Defined"
        self.description = dict["description"] as? String ?? "Not Defined"
    }
    
}
