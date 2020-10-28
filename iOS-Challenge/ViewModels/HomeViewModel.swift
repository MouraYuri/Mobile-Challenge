//
//  HomeViewModel.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//
    
import Foundation

protocol HomeViewModelDelegate: class {
    func didFinishFetching(data: [String:[Any]])
}


class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    func fetchData() {
        
        let url = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
        
        Services.shared.makeRequest(to: url, method: .get) { [weak self] (data, error) in
            guard let self = self else {return}
            guard let _ = error else {
                if let data = data {
                    
                    var retSpotlights: [Spotlight] = []
                    var retProducts: [Product] = []
                    var retCash = Cash()
                    
                    if let spotlightsDict = data["spotlight"] as? [[String:Any]] {
                        retSpotlights = self.parseDictToSpotlights(spotlightsDict)
                    }
                    
                    if let productsDict = data["products"] as? [[String:Any]] {
                        retProducts = self.parseDictToProducts(productsDict)
                    }
                    
                    if let cashDict = data["cash"] as? [String:Any] {
                        retCash = Cash(cashDict)
                    }
                    
                    let dataToBeReturned: [String:[Any]] = [
                                                            "spotlights":retSpotlights,
                                                            "products":retProducts,
                                                            "cash":[retCash]
                                                            ]
                    
                    self.delegate?.didFinishFetching(data: dataToBeReturned)
                }
                return
            }
            
        }
    }
    
    func parseDictToSpotlights(_ dict: [[String:Any]]) -> [Spotlight] {
        var spotlights: [Spotlight] = []
        for element in dict {
            spotlights.append(Spotlight(element))

        }
        return spotlights
    }
    
    func parseDictToProducts(_ dict: [[String:Any]]) -> [Product] {
        var products: [Product] = []
        for element in dict {
            products.append(Product(element))
        }
        return products
    }
    
}
