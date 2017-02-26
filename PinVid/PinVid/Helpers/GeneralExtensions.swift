//
//  Extensions.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    var snapshotImage: UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        let image = renderer.image { ctx in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
        return image
    }
}

enum Controllers: String {
    //capitalize on purpose to use rawdata as id
    case ProfileListViewController, EmailViewController, YouTubeViewController, CreateClipsViewController, DetailViewController, ViewController
    var identifier: String {
        switch self {
        default: return self.rawValue
        }
    }
    
    var storyboardName: String {
        switch self {
        case .ProfileListViewController, .DetailViewController: return "ProfileList"
        case .EmailViewController: return "Auth"
        case .YouTubeViewController, .ViewController: return "Main"
        case .CreateClipsViewController: return "CreateClips"
        }
    }
}
