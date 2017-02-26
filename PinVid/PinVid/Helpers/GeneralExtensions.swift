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

protocol ViewControllerInstantiable {
    //set id in storyboard, and call this 
    static func instantiate(controllerType type: UIViewController.Type) -> UIViewController
}

extension UIViewController: ViewControllerInstantiable {
    static func instantiate(controllerType type: UIViewController.Type) -> UIViewController {
        let controllerName = String(describing: type.self)
        guard let controllerEnum = Controllers.init(rawValue: controllerName) else {
            fatalError("Busted!!: no suct controller defined")
        }
        let storyboard = UIStoryboard(name: controllerEnum.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: controllerEnum.identifier) //cast back to what you want
        return vc
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







