//
//  ScrubberView.swift
//  PinVid
//
//  Created by Stanley Chiang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class ScrubberView: UIView {

    var rangeSlider: RangeSlider!
    var tenSecBack: UIButton!
    var oneSecBack: UIButton!
    var oneSecForward: UIButton!
    var tenSecForward: UIButton!
    var addClip:UIButton!
    
    var skipperStackView: UIStackView!
    
    var timerButton:UIButton!
    var clipRecord:UIButton!
    
    var prevStartTime:Double?
    var prevEndTime:Double?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        rangeSlider = RangeSlider(frame: frame)
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rangeSlider)
        
        timerButton = UIButton()
        timerButton.backgroundColor = UIColor.black
        timerButton.translatesAutoresizingMaskIntoConstraints = false
        timerButton.setTitle("0:00", for: .normal)
        addSubview(timerButton)
        
        addClip = UIButton()
        addClip.translatesAutoresizingMaskIntoConstraints = false
        addClip.backgroundColor = UIColor.black
        addClip.setTitle("Save Clip!", for: .normal)
        
        tenSecBack = UIButton()
        tenSecBack.translatesAutoresizingMaskIntoConstraints = false
        tenSecBack.backgroundColor = UIColor.black
        tenSecBack.setTitle("<<", for: .normal)
        
        oneSecBack = UIButton()
        oneSecBack.translatesAutoresizingMaskIntoConstraints = false
        oneSecBack.backgroundColor = UIColor.black
        oneSecBack.setTitle("<", for: .normal)
        
        oneSecForward = UIButton()
        oneSecForward.translatesAutoresizingMaskIntoConstraints = false
        oneSecForward.backgroundColor = UIColor.black
        oneSecForward.setTitle(">", for: .normal)
        
        tenSecForward = UIButton()
        tenSecForward.translatesAutoresizingMaskIntoConstraints = false
        tenSecForward.backgroundColor = UIColor.black
        tenSecForward.setTitle(">>", for: .normal)
        
        let buttons:[UIView] = [tenSecBack, oneSecBack, addClip, oneSecForward, tenSecForward]
        skipperStackView = UIStackView(arrangedSubviews: buttons)
        skipperStackView.translatesAutoresizingMaskIntoConstraints = false
        skipperStackView.axis = .horizontal
        skipperStackView.distribution = .fillEqually
        addSubview(skipperStackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        timerButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        timerButton.trailingAnchor.constraint(equalTo: rangeSlider.leadingAnchor).isActive = true
        timerButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        timerButton.bottomAnchor.constraint(equalTo: skipperStackView.topAnchor).isActive = true
        timerButton.heightAnchor.constraint(equalToConstant: self.frame.height / 4).isActive = true
        timerButton.widthAnchor.constraint(equalToConstant: self.frame.height * 2 / 5).isActive = true
        
        rangeSlider.leadingAnchor.constraint(equalTo: timerButton.trailingAnchor).isActive = true
        rangeSlider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rangeSlider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rangeSlider.bottomAnchor.constraint(equalTo: skipperStackView.topAnchor).isActive = true
        
        skipperStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        skipperStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        skipperStackView.topAnchor.constraint(equalTo: timerButton.bottomAnchor).isActive = true
        skipperStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
