//
//  SearchView.swift
//  PinVid
//
//  Created by Stanley Chiang on 2/26/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class SearchView: UIView {

    var searchView:UIView!
    var urlTextField: UITextField!
    var loadURL:UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)

        urlTextField = UITextField()
        urlTextField.translatesAutoresizingMaskIntoConstraints = false
        urlTextField.backgroundColor = UIColor.white
        urlTextField.text = "https://www.youtube.com/watch?v=kXzGyrbjWGY"
        addSubview(urlTextField)
        
        loadURL = UIButton()
        loadURL.translatesAutoresizingMaskIntoConstraints = false
        loadURL.backgroundColor = UIColor.yellow
        loadURL.setTitle("Load Video", for: .normal)
        loadURL.setTitleColor(UIColor.black, for: .normal)
        addSubview(loadURL)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        urlTextField.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        urlTextField.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        urlTextField.trailingAnchor.constraint(equalTo: loadURL.leadingAnchor).isActive = true
        urlTextField.heightAnchor.constraint(equalToConstant: self.frame.height / 2).isActive = true
        
        loadURL.leadingAnchor.constraint(equalTo: urlTextField.trailingAnchor).isActive = true
        loadURL.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        loadURL.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        loadURL.heightAnchor.constraint(equalToConstant: self.frame.height / 2).isActive = true
        loadURL.widthAnchor.constraint(equalToConstant: self.frame.width * 2 / 5).isActive = true
    }
}
