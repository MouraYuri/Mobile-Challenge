//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    lazy var spotlightView: SpotlightView = {
        obj = SpotlightView()
        return obj
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.fetchData()
    }
    
    func setupConstraints(){
        self.view.addSubview(spotlightView)
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func didFinishFetching(data: [String : [Any]]) {
        
    }
    
    
}
