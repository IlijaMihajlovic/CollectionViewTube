//
//  MenuBar.swift
//  NavBarCustom
//
//  Created by Ilija Mihajlovic on 3/27/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    
    static let sharedInstance = MenuBar()
    
    var tapHandelr: (()->())?
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    let cellId = "cellId"
    let imageNames = ["camera", "save", "photoLibrary"]
    
    
    
   lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .brown
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //Register a class for use in creating new collection view cells.
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        backgroundColor = UIColor.blue
        addConstraints()
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: [])
        
        setupHorizontalBar()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        horizontalBarView.backgroundColor = .yellow
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    private func addConstraints() {
    collectionView.anchor(top: nil, bottom: bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, size: .init(width: 0, height: 50))
    }
    
    
}


extension MenuBar: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource , UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor.green
       
        return cell
        
    }
    
    
    //It leyouts them out equally from left side to the right side
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width / 3, height: frame.height)
    }
    
    
    //Gets the spacing bettwen cells to zero
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        
        let x = CGFloat(indexPath.item) * frame.width / 3
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        
    }
    

    
    
    
    
}

class MenuCell: BaseCell {
    
    let shared = MenuBar()
    
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "camera")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .green
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override var isHighlighted: Bool {
        didSet {
            imageView.tintColor = isHighlighted ? UIColor.red : UIColor.green
        }
    }
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.red : UIColor.green
        }
    }
    
    
    
    override func setupViews() {
        super.setupViews()
        configImage()
        
    }
    
    
    
    private func configImage()
    {
        self.addSubview(self.imageView)
        
        [   self.imageView.heightAnchor.constraint(equalToConstant: 35),
            self.imageView.widthAnchor.constraint(equalToConstant: 35),
            self.imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ].forEach({$0.isActive = true})
    }
}
