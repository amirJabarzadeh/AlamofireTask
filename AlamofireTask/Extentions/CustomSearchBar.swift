//
//  CustomSearchBar.swift
//  AlamofireTask
//
//  Created by developer on 5/20/22.
//

import UIKit

class CustomSearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let textFieldInsideSearchBar = value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = UIColor.black
        textFieldInsideSearchBar?.font = UIFont.systemFont(ofSize: 14)
        textFieldInsideSearchBar?.backgroundColor = UIColor.white
        textFieldInsideSearchBar?.addDoneButtonOnKeyboard()
        searchBarStyle = .minimal
        placeholder = "Search"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
