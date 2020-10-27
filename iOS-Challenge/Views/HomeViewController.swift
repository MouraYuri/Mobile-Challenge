//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by Yuri Moura on 26/10/20.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.navigationController?.title = "Home View Controller"
        
        Services.shared.makeRequest(to: "", method: "")
    }

}
