//
//  CeateClipsViewController.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class CreateClipsViewController: UIViewController {

    var url:NSURL!
    var startTime:Int!
    
    var videoView = VideoView()
    var scrubberView = ScrubberView()
    var clipsView = ClipsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.backgroundColor = UIColor.orange
        self.view.addSubview(videoView)
        
        scrubberView.translatesAutoresizingMaskIntoConstraints = false
        scrubberView.backgroundColor = UIColor.cyan
        self.view.addSubview(scrubberView)
        
        clipsView.translatesAutoresizingMaskIntoConstraints = false
        clipsView.backgroundColor = UIColor.lightGray
        self.view.addSubview(clipsView)
    }
    
    override func viewWillLayoutSubviews() {
        videoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        videoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        videoView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        videoView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 2).isActive = true
        
        scrubberView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        scrubberView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        scrubberView.topAnchor.constraint(equalTo: videoView.bottomAnchor).isActive = true
        scrubberView.bottomAnchor.constraint(equalTo: clipsView.topAnchor).isActive = true
        
        clipsView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        clipsView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        clipsView.heightAnchor.constraint(equalToConstant: self.view.frame.height / 5).isActive = true
        clipsView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        
    }

}
