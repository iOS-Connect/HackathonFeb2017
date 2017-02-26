//
//  ProfileClip.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit
import SDWebImage

class ProfileClipCell: UICollectionViewCell {
    @IBOutlet weak var constraint: NSLayoutConstraint!
    
    static let identifier = "ProfileClipCell"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    var montage: Montage! //must set
    func updateUI() {
        
        if let thumbUrl = montage.clips[0].thumbnail_url, let thumbURL = URL(string: thumbUrl) {
            imageView.sd_setImage(with: thumbURL)
            
        }
        title.text = montage.title
        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2
        self.userImageView.clipsToBounds = true
    }
}
