//
//  RequestData.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 28/10/20.
//

import Foundation

struct HomeResponseData: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}
