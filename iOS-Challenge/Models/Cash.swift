//
//  Cash.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import Foundation
struct Cash: Codable {
    let title: String
    let bannerURL: String
    let description: String
    
    init(_ dict: [String:Any]) {
        self.title = dict["name"] as? String ?? "Not Defined"
        self.bannerURL = dict["bannerURL"] as? String ?? "Not Defined"
        self.description = dict["description"] as? String ?? "Not Defined"
    }
    
    init(){
        self.title = "Not Defined"
        self.bannerURL = "Not Defined"
        self.description = "Not Defined"
    }
}
