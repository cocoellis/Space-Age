//
//  ViewController.swift
//  Not Space Age
//
//  Created by Kyle Smith on 10/23/18.
//  Copyright © 2018 smithcoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var ourView: OurView = {
        let ov = OurView()
        return ov
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ourView)
        
        _ = ourView.anchor(view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

