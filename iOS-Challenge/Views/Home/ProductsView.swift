//
//  ProductsView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class ProductsView: UIView {
    
    var products: [Product] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    lazy var viewTitleLabel: UILabel = {
        let obj = UILabel()
        obj.text = "Produtos"
        obj.translatesAutoresizingMaskIntoConstraints = false
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
    
    override func didMoveToSuperview() {
        self.setupConstraints()
        self.backgroundColor = .brown
    }
    
    func setupConstraints(){
        self.addSubview(self.viewTitleLabel)
        self.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.viewTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.viewTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.viewTitleLabel.bottomAnchor),
            self.collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.9),
            self.collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            self.collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}

extension ProductsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: FullImageCollectionViewCell.identifier, for: indexPath) as? FullImageCollectionViewCell {
            let product = self.products[indexPath.row]
            cell.config(imageURL: product.bannerURL)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
