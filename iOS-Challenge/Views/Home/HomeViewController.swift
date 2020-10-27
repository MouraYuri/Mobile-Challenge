//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    lazy var userNameLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Olá, Maria"
        return UILabel()
    }()
    
    lazy var spotlightView: SpotlightView = {
        let obj = SpotlightView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    lazy var centerView: HomeCenterView = {
        let obj = HomeCenterView()
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
        self.view.addSubview(self.userNameLabel)
        self.view.addSubview(self.spotlightView)
        self.view.addSubview(self.centerView)
        
        let viewsWidthMultiplier = CGFloat(0.95)
        
        NSLayoutConstraint.activate([
            self.spotlightView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.spotlightView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            self.spotlightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.spotlightView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.centerView.topAnchor.constraint(equalTo: self.spotlightView.bottomAnchor, constant: 8),
            self.centerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.25),
            self.centerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.centerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }

}

extension HomeViewController: HomeViewModelDelegate {
    func didFinishFetching(data: [String : [Any]]) {
        if let spotlights = data["spotlights"] as? [Spotlight] {
            self.spotlightView.spotlights = spotlights
        }
        
        if let centerViewData = data["cash"]?.first as? Cash {
            self.centerView.setupImage(imageURL: centerViewData.bannerURL)
        }
    }
    
    
}
