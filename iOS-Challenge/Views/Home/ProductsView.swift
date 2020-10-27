//
//  ProductsView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class ProductsView: UIView {
    
    lazy var viewTitleLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Produtos"
        return obj
    }()
    

    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height*0.25)
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

}

extension ProductsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: FullImageCollectionViewCell.identifier, for: indexPath) as? FullImageCollectionViewCell {
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
