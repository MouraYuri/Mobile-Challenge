//
//  HomeViewModel.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//
    
import Foundation

protocol HomeViewModelDelegate: class {
    func didFinishFetching(data: HomeResponseData)
}


class HomeViewModel {
    
    weak var delegate: HomeViewModelDelegate?
    
    func fetchData() {
        
        let url = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
        
        Services.shared.makeRequest(to: url, method: .get) { [weak self] (data, error) in
            guard let self = self else {return}
            guard let _ = error else {
                if let data = data {
                    do {
                        let homeResponseData = try JSONDecoder().decode(HomeResponseData.self, from: data)
                        self.delegate?.didFinishFetching(data: homeResponseData)
                    }catch {
                        print(error.localizedDescription)
                    }
                }
                return
            }
            
        }
    }
    
}
