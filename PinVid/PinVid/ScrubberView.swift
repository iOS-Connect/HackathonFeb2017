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
    
    var stackView: UIStackView!
    
    var startTimeButton:UIButton!
    var endTimeButton:UIButton!
    var clipRecord:UIButton!
    
    var prevStartTime:Double?
    var prevEndTime:Double?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        rangeSlider = RangeSlider(frame: frame)
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rangeSlider)
        
        addClip = UIButton()
        addClip.translatesAutoresizingMaskIntoConstraints = false
        addClip.backgroundColor = UIColor.green
        addClip.setTitle("Save Clip", for: .normal)
        
        tenSecBack = UIButton()
        tenSecBack.translatesAutoresizingMaskIntoConstraints = false
        tenSecBack.backgroundColor = UIColor.brown
        tenSecBack.setTitle("<<", for: .normal)
        
        oneSecBack = UIButton()
        oneSecBack.translatesAutoresizingMaskIntoConstraints = false
        oneSecBack.backgroundColor = UIColor.purple
        oneSecBack.setTitle("<", for: .normal)
        
        oneSecForward = UIButton()
        oneSecForward.translatesAutoresizingMaskIntoConstraints = false
        oneSecForward.backgroundColor = UIColor.magenta
        oneSecForward.setTitle(">", for: .normal)
        
        tenSecForward = UIButton()
        tenSecForward.translatesAutoresizingMaskIntoConstraints = false
        tenSecForward.backgroundColor = UIColor.orange
        tenSecForward.setTitle(">>", for: .normal)
        
        startTimeButton = UIButton()
        startTimeButton.backgroundColor = UIColor.blue
        startTimeButton.translatesAutoresizingMaskIntoConstraints = false
        startTimeButton.setTitle("Start: 0:00", for: .normal)
        addSubview(startTimeButton)
        
        endTimeButton = UIButton()
        endTimeButton.backgroundColor = UIColor.red
        endTimeButton.translatesAutoresizingMaskIntoConstraints = false
        endTimeButton.setTitle("End: 0:00", for: .normal)
        addSubview(endTimeButton)
        
        let buttons:[UIView] = [tenSecBack, oneSecBack, addClip, oneSecForward, tenSecForward]
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        rangeSlider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        rangeSlider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rangeSlider.topAnchor.constraint(equalTo: topAnchor).isActive = true
        rangeSlider.heightAnchor.constraint(equalToConstant: self.frame.height / 4).isActive = true
        
        startTimeButton.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        startTimeButton.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        startTimeButton.topAnchor.constraint(equalTo: rangeSlider.bottomAnchor).isActive = true
        startTimeButton.bottomAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        startTimeButton.heightAnchor.constraint(equalToConstant: self.frame.height / 4).isActive = true
        startTimeButton.setContentHuggingPriority(10, for: UILayoutConstraintAxis.vertical)
        
        endTimeButton.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        endTimeButton.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        endTimeButton.topAnchor.constraint(equalTo: rangeSlider.bottomAnchor).isActive = true
        endTimeButton.bottomAnchor.constraint(equalTo: stackView.topAnchor).isActive = true
        endTimeButton.heightAnchor.constraint(equalToConstant: self.frame.height / 4).isActive = true
        endTimeButton.setContentHuggingPriority(10, for: UILayoutConstraintAxis.vertical)
        
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: startTimeButton.bottomAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
}
