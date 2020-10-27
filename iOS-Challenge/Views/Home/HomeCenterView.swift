//
//  HomeCenterView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class HomeCenterView: UIView {

    lazy var viewTitleLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "digio cash"
        return obj
    }()
    
    lazy var imageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
        self.backgroundColor = .green
    }
    
    func setupConstraints(){
        self.addSubview(self.viewTitleLabel)
        self.addSubview(self.imageView)
        
        NSLayoutConstraint.activate([
            self.viewTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.viewTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8)
        ])
    }

}
