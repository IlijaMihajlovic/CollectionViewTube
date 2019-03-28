//
//  BaseCell.swift
//  NavBarCustom
//
//  Created by Ilija Mihajlovic on 3/27/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit
class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
