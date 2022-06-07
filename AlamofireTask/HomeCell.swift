//
//  HomeCell.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit

class HomeCell: BaseCell {
    
    let image = UIImageView()
    
    override func setupViews() {
        image.contentMode = .scaleAspectFit
        addSubview(image)
        image.anchor(.height(100) , .width(100))
        image.centerInSuperview()

    }
    
  
    
}
