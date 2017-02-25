//
//  Montage.swift
//
//  Created by Kei Sakaguchi on 2/25/17.
//

import Foundation
import SwiftyJSON

class Montage {
    
    var montage_id: String?
    var yt_url: String?
    var title: String?
    var desc: String?
    var author: String? // name of author
    var clips = [Clip]()
    
    init(json: SwiftyJSON.JSON) {
        self.montage_id = json["montage_id"].string
        self.yt_url = json["yt_url"].string
        self.title = json["title"].string
        self.desc = json["desc"].string
        self.author = json["author"].string
        
        for (index, clipJson) in json["clips"] {
            print("\(index) resp: \(clipJson)")
            //instantiate, check if nil, then append
            clips.append(Clip(json: clipJson))
        }
    }
    
    func toString() -> String {
        return "Montage ID: \(montage_id)" +
               " Youtube URL: \(yt_url)" +
               " Title: \(title)" +
               " Description: \(desc)" +
               " Author: \(author)"
    }
    
    func toJSON() -> [String: AnyObject] {
        var json = [String: AnyObject]()
        if let montage_id = montage_id {
            json["montage_id"] = montage_id as AnyObject?
        }
        if let yt_url = yt_url {
            json["yt_url"] = yt_url as AnyObject?
        }
        if let title = title {
            json["title"] = title as AnyObject?
        }
        if let desc = desc {
            json["desc"] = desc as AnyObject?
        }
        if let author = author {
            json["author"] = author as AnyObject?
        }
        return json
    }
    
}
