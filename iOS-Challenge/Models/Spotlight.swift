//
//  Spotlight.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import Foundation
struct Spotlight {
    let name: String?
    let bannerURL: String?
    let description: String?
    
    init(_ dict: [String:Any]) {
        self.name = dict["name"] as? String ?? "Not Defined"
        self.bannerURL = dict["bannerURL"] as? String ?? "Not Defined"
        self.description = dict["description"] as? String ?? "Not Defined"
    }
    
}
