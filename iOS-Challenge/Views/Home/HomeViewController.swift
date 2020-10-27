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
        let obj = SpotlightView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConstraints()
        self.view.backgroundColor = .white
        
        self.viewModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.fetchData()
    }
    
    func setupConstraints(){
        self.view.addSubview(spotlightView)
        
        NSLayoutConstraint.activate([
            self.spotlightView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.spotlightView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.35),
            self.spotlightView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
            self.spotlightView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func didFinishFetching(data: [String : [Any]]) {
        
    }
    
    
}
