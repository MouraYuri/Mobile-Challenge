//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    lazy var header: HeaderHomeView = {
        let obj = HeaderHomeView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
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
    
    lazy var productsView: ProductsView = {
        let obj = ProductsView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupConstraints()
        self.view.backgroundColor = .white
        
        self.viewModel.delegate = self
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.fetchData()
    }
    
    func setupConstraints(){
        self.view.addSubview(self.header)
        self.view.addSubview(self.spotlightView)
        self.view.addSubview(self.centerView)
        self.view.addSubview(self.productsView)
        
        let viewsWidthMultiplier = CGFloat(1.0)
        
        NSLayoutConstraint.activate([
            self.header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.header.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05),
            self.header.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.header.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.spotlightView.topAnchor.constraint(equalTo: self.header.bottomAnchor),
            self.spotlightView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            self.spotlightView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.spotlightView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.centerView.topAnchor.constraint(equalTo: self.spotlightView.bottomAnchor, constant: 8),
            self.centerView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3),
            self.centerView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.centerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            self.productsView.topAnchor.constraint(equalTo: self.centerView.bottomAnchor, constant: 8),
            self.productsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.productsView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: viewsWidthMultiplier),
            self.productsView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
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
        
        if let products = data["products"] as? [Product] {
            self.productsView.products = products
        }
    }
    
    
}
