//
//  VideoView.swift
//  PinVid
//
//  Created by Stanley Chiang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

protocol VideoViewDelegate:class {
    func ready(playerView:YTPlayerView)
    func getEndTime() -> Float?
    func getStartTime() -> Float?
}

class VideoView: UIView, YTPlayerViewDelegate {

    weak var delegate:VideoViewDelegate?
    var player:YTPlayerView!
    var videoId: String = "TgqiSBxvdws"
    let playerVars = ["controls":0,"playsinline":1, "autohide":1, "showinfo":0, "modestbranding":1, "autoplay":1]
    var mainPlayTime = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        player = YTPlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        self.player.delegate = self
        addSubview(player)
    
        player.load(withVideoId: videoId, playerVars:playerVars)
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
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
        delegate?.ready(playerView: playerView)
    }
    
    func playerView(_ playerView: YTPlayerView, didPlayTime playTime: Float) {
        mainPlayTime = Double(playTime)
        if delegate?.getEndTime() != nil && delegate?.getStartTime() != nil && playTime >= (delegate?.getEndTime())! {
            print("seek to beginning")
            player.seek(toSeconds: (delegate?.getStartTime())!, allowSeekAhead: true)
        }
    }
}
