//
//  SpotlightView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class SpotlightView: UIView {
    
    var spotlights: [Spotlight] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*0.8, height: UIScreen.main.bounds.height*0.25)
        layout.scrollDirection = .horizontal
        
        let obj = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        obj.showsHorizontalScrollIndicator = false
        obj.automaticallyAdjustsScrollIndicatorInsets = false
        obj.delegate = self
        obj.dataSource = self
        obj.register(FullImageCollectionViewCell.self, forCellWithReuseIdentifier: FullImageCollectionViewCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .clear
        return obj
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setupConstraints()
    }
    
    func setupConstraints(){
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            self.collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            self.collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
    }

}

extension SpotlightView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: FullImageCollectionViewCell.identifier, for: indexPath) as? FullImageCollectionViewCell {
            let spotlight = self.spotlights[indexPath.row]
            cell.config(imageURL: spotlight.bannerURL)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
}
