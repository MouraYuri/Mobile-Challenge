//
//  SpotlightView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class SpotlightView: UIView {
    
    var spotlights: [Spotlight] = []
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 20, height: 20)
        layout.scrollDirection = .horizontal
        
        let obj = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        obj.delegate = self
        obj.dataSource = self
        obj.register(FullImageCollectionViewCell.self, forCellWithReuseIdentifier: FullImageCollectionViewCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
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

extension SpotlightView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: FullImageCollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
