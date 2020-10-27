//
//  FullImageCollectionViewCell.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit
import SDWebImage

class FullImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FullImageCollectionViewCell"
    
    lazy var imageViewContainer: UIView = {
        let obj = UIView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.backgroundColor = .white
        obj.layer.masksToBounds = false
        
        return obj
    }()
    
    lazy var cellImageView: UIImageView = {
        let obj = UIImageView()
        obj.layer.masksToBounds = true
        obj.layer.cornerRadius = 12
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
        self.backgroundColor = .clear
        self.setupShadow()
    }
    
    func setupShadow(){
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func config(imageURL: String) {
        self.cellImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
    
    func setupConstraints(){
        self.addSubview(self.cellImageView)
        
        NSLayoutConstraint.activate([
            self.cellImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8),
            self.cellImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 1.0),
            self.cellImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.cellImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
    
}
