//
//  CustomCollectionView.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit

class CustomCollectinView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        super.init(frame: frame, collectionViewLayout: layout)
        backgroundColor = .white
        showsVerticalScrollIndicator = false
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
