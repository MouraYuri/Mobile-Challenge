//
//  SpotlightView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class SpotlightView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let obj = UICollectionView()
        return obj
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupConstraints()
        self.backgroundColor = .blue
    }
    
    func setupConstraints(){
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8),
            self.collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            self.collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }

}
