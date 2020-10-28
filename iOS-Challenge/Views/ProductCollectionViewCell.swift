//
//  ProductCollectionViewCell.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionCellIdentifier"
    
    lazy var imageViewContainer: UIView = {
        let obj = UIView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .white
        obj.layer.masksToBounds = false
        obj.layer.cornerRadius = 12
        obj.layer.shadowColor = UIColor.black.cgColor
        obj.layer.shadowOpacity = 0.35
        obj.layer.shadowOffset = CGSize(width: 0, height: 2)
        return obj
    }()
    
    lazy var imageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
    }
    
    func setupConstraints(){
        self.addSubview(self.imageViewContainer)
        self.addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            self.imageViewContainer.heightAnchor.constraint(equalTo: self.heightAnchor),
            self.imageViewContainer.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.imageViewContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageViewContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.6),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    func config(imageURL: String) {
        self.imageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
}
