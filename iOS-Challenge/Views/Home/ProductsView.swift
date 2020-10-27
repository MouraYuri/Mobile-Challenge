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
        obj.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        obj.textColor = .blue
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    

    lazy var collectionView: UICollectionView = { [unowned self] in
        
        let windowBounds = UIScreen.main.bounds
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: windowBounds.width*0.04, bottom: 0, right: windowBounds.width*0.04)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/3.2, height: UIScreen.main.bounds.height*0.15)
        layout.scrollDirection = .horizontal
        
        let obj = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        obj.showsHorizontalScrollIndicator = false
        obj.automaticallyAdjustsScrollIndicatorInsets = false
        obj.delegate = self
        obj.dataSource = self
        obj.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .clear
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
    }
    
    func setupConstraints(){
        self.addSubview(self.viewTitleLabel)
        self.addSubview(self.collectionView)
        
        let windowBounds = UIScreen.main.bounds
        
        NSLayoutConstraint.activate([
            self.viewTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 32),
            self.viewTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: windowBounds.width*0.045)
        ])
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.viewTitleLabel.bottomAnchor, constant: 2),
            self.collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            self.collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0),
            self.collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

}

extension ProductsView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell {
            let product = self.products[indexPath.row]
            cell.config(imageURL: product.bannerURL)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
