//
//  ViewController.swift
//  NavBarCustom
//
//  Created by Ilija Mihajlovic on 3/27/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "cellId"
    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        mb.backgroundColor = .red
        return mb
    }()

   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuBar()
        view.backgroundColor = .orange
        
        
    }
    
   
    private func setupMenuBar() {
        view.addSubview(menuBar)
        menuBar.anchor(top: nil, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, size: .init(width: 0, height: 50))
        
    }
    
    

    

}

