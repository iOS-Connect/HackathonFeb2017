//
//  CeateClipsViewController.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class CreateClipsViewController: UIViewController, VideoViewDelegate {

    var url:NSURL!
    var startTime:Int!
    
    var videoView: VideoView!
    var scrubberView = ScrubberView()
    var clipsView = ClipsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        scrubberView.rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged(sender:)), for: .valueChanged)
    }
    
    func setupNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addTapped))
    }
    
    func setupView() {
        videoView = VideoView(frame: .zero)
        videoView.translatesAutoresizingMaskIntoConstraints = false
        videoView.backgroundColor = UIColor.orange
        videoView.delegate = self
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

    func addTapped(sender: UIButton) {
        
        print("done")
    }
    
    func rangeSliderValueChanged(sender:RangeSlider){
        if scrubberView.prevEndTime != sender.upperValue {
            scrubberView.prevEndTime = sender.upperValue
            videoView.player.seek(toSeconds: Float(sender.upperValue), allowSeekAhead: true)
            print("updated end time to \(scrubberView.prevEndTime) - 3 sec")
        }
        
        if scrubberView.prevStartTime != sender.lowerValue {
            scrubberView.prevStartTime = sender.lowerValue
            videoView.player.seek(toSeconds: Float(sender.lowerValue), allowSeekAhead: true)
            print("updated start time to \(scrubberView.prevStartTime)")
        }
    }
    
    func ready(playerView: YTPlayerView) {
        scrubberView.rangeSlider.maximumValue = playerView.duration()
        scrubberView.rangeSlider.upperValue = playerView.duration() * 2.0 / 3.0
        scrubberView.rangeSlider.lowerValue = playerView.duration() / 3.0
    }
}
