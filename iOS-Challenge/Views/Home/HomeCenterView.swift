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
        obj.contentMode = .scaleToFill
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.layer.masksToBounds = true
        obj.layer.cornerRadius = 12
        return obj
    }()
    
    override func didMoveToSuperview() {
        self.setupConstraints()
        self.setupViewTitleLabelText()
    }
    
    func setupImage(imageURL: String) {
        self.imageView.sd_setImage(with: URL(string: imageURL), completed: nil)
    }
    
    func setupConstraints(){
        self.addSubview(self.viewTitleLabel)
        self.addSubview(self.imageView)
        
        let windowBounds = UIScreen.main.bounds
        
        NSLayoutConstraint.activate([
            self.viewTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.viewTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: windowBounds.width*0.045)
        ])
        
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.viewTitleLabel.bottomAnchor, constant: 16),
            self.imageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.92),
            self.imageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setupViewTitleLabelText() {
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.blue]

        let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.gray]

        let attributedString1 = NSMutableAttributedString(string:"digio", attributes:attrs1)

        let attributedString2 = NSMutableAttributedString(string:" Cash", attributes:attrs2)

        attributedString1.append(attributedString2)
        self.viewTitleLabel.attributedText = attributedString1
    }

}
