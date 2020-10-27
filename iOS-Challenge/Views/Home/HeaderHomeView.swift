//
//  HeaderHomeView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class HeaderHomeView: UIView {

    lazy var userImageView: UIImageView = {
        let obj = UIImageView()
        obj.translatesAutoresizingMaskIntoConstraints = false
        return obj
    }()
    
    let userNameLabel: UILabel = {
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.text = "Olá, Maria"
        obj.textColor = .black
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
    }
    
    func setupConstraints(){
        self.addSubview(self.userImageView)
        self.addSubview(self.userNameLabel)
        
        let windowBounds = UIScreen.main.bounds
        
        NSLayoutConstraint.activate([
            self.userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: windowBounds.width*0.045),
            self.userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: windowBounds.width*0.045),
        ])
        
        NSLayoutConstraint.activate([
            self.userNameLabel.leadingAnchor.constraint(equalTo: self.userImageView.trailingAnchor, constant: 4),
            self.userNameLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0),
            self.userNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }

}
