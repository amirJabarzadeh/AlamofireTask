//
//  BaseCollectionViewCell.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit

class BaseCell: UICollectionViewCell {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        backgroundColor = .white
    }
    
    func setupViews() {
        
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
