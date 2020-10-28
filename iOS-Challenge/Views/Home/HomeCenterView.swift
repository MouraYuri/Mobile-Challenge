//
//  HomeCenterView.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 27/10/20.
//

import UIKit

class HomeCenterView: UIView {

    lazy var viewTitleLabel: UILabel = { [unowned self] in
        let obj = UILabel()
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.attributedText = self.getAttributedTextForViewTitleLabel(string1: "digio", string2: "Cash")
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
    
    func getAttributedTextForViewTitleLabel(string1: String, string2: String?) -> NSMutableAttributedString {
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.blue]

        let attributedString1 = NSMutableAttributedString(string:string1, attributes:attrs1)

        if let str2 = string2 {
            let attrs2 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 22, weight: .bold), NSAttributedString.Key.foregroundColor : UIColor.gray]
            
            let attributedString2 = NSMutableAttributedString(string:" "+str2, attributes:attrs2)
            attributedString1.append(attributedString2)
        }
        
        return attributedString1
    }

}
