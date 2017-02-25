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
    var addClip:UIButton!
    var startTimeLabel:UILabel!
    var endTimeLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        rangeSlider = RangeSlider(frame: frame)
        rangeSlider.translatesAutoresizingMaskIntoConstraints = false
        addSubview(rangeSlider)
        rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged),
                              for: .valueChanged)
        
        addClip = UIButton()
        addClip.translatesAutoresizingMaskIntoConstraints = false
        addClip.addTarget(self, action: #selector(addClipPressed), for: .touchUpInside)
        addClip.backgroundColor = UIColor.green
        addClip.setTitle("Add Clip", for: .normal)
        addSubview(addClip)
        
        startTimeLabel = UILabel()
        startTimeLabel.backgroundColor = UIColor.blue
        startTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        startTimeLabel.text = "Start: 0:00"
        startTimeLabel.textAlignment = .center
        addSubview(startTimeLabel)
        
        endTimeLabel = UILabel()
        endTimeLabel.backgroundColor = UIColor.red
        endTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        endTimeLabel.text = "End: 0:00"
        endTimeLabel.textAlignment = .center
        addSubview(endTimeLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        
        rangeSlider.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        rangeSlider.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        rangeSlider.topAnchor.constraint(equalTo: topAnchor, constant: self.frame.height / 3).isActive = true
        rangeSlider.heightAnchor.constraint(equalToConstant: self.frame.height / 3).isActive = true
        
        addClip.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        addClip.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        addClip.topAnchor.constraint(equalTo: rangeSlider.bottomAnchor).isActive = true
        addClip.heightAnchor.constraint(equalToConstant: self.frame.height / 3).isActive = true
        
        startTimeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        startTimeLabel.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        startTimeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        startTimeLabel.bottomAnchor.constraint(equalTo: rangeSlider.topAnchor).isActive = true

        endTimeLabel.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        endTimeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        endTimeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        endTimeLabel.bottomAnchor.constraint(equalTo: rangeSlider.topAnchor).isActive = true
    }
    
    func rangeSliderValueChanged(){
        print("lowerVal = \(rangeSlider.lowerValue) | heigherVal = \(rangeSlider.upperValue)")
    }
    
    func addClipPressed(sender:UIButton){
        print("addclip")
    }
}
