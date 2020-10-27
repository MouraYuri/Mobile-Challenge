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
    
    lazy var cellImageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    override func didMoveToSuperview() {
        
    }
    
    func config(imageURL: String) {
        self.cellImageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
    
    func setupConstraints(){
        self.addSubview(self.cellImageView)
        
        NSLayoutConstraint.activate([
            self.cellImageView.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.8),
            self.cellImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.95),
            self.cellImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.cellImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
        ])
    }
    
}
