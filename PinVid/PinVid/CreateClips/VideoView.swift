//
//  VideoView.swift
//  PinVid
//
//  Created by Stanley Chiang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class VideoView: UIView, YTPlayerViewDelegate {

    var player:YTPlayerView!
    let playlistID = "PLhBgTdAWkxeCMHYCQ0uuLyhydRJGDRNo5"
    let playerVars = ["controls":1,"playsinline":1, "autohide":1, "showinfo":0, "modestbranding":1]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        player = YTPlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.player.delegate = self
        addSubview(player)
    
        
//        player.load(withVideoId: "TgqiSBxvdws", playerVars: ["autoplay":1])
        player.load(withVideoId: "TgqiSBxvdws", playerVars:playerVars)
        player.playVideo()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(receivedPlaybackStartedNotification(notification:)), name: NSNotification.Name(rawValue: "Playback started"), object: nil)
    }
    
    func receivedPlaybackStartedNotification(notification:NSNotification){
        print("receivedPlaybackStartedNotification")
//        if notification.name == "Playback started" && notification.object != self {
//            player.pauseVideo()
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        player.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        player.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        player.topAnchor.constraint(equalTo: topAnchor).isActive = true
        player.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
}
