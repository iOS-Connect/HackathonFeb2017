//
//  YouTubeViewController.swift
//  PinVid
//
//  Created by Peer Dampmann on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit

class YouTubeViewController: UIViewController {
    let js = "function f() { var url = yt.player.utils.videoElement_.ownerDocument.URL + \"?t=\" + yt.player.utils.videoElement_.ownerDocument.activeElement.currentTime; return(url);} f();"
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func clickAction(_ sender: UIButton) {
        let res = webView.stringByEvaluatingJavaScript(from: js)
        print(res ?? "no result")
        
        //call your function you get an url
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(URLRequest(url: URL(string: "https://m.youtube.com")!))
    }
}
