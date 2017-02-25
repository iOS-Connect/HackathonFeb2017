//
//  Clip.swift
//
//  Created by Kei Sakaguchi on 2/25/17.
//

import Foundation
import SwiftyJSON

class Clip {
    
    var start_time: Int?
    var end_time: Int?
    var thumbnail_url: String?
    
    init(json: SwiftyJSON.JSON) {
        self.start_time = json["start_time"].int
        self.end_time = json["end_time"].int
        self.thumbnail_url = json["thumbnail_url"].string
    }
    
    func toString() -> String {
        return "Start time: \(start_time)" +
               " End time: \(end_time)" +
               " Thumbnail URL: \(thumbnail_url)"
    }
    
    func toJSON() -> [String: AnyObject] {
        var json = [String: AnyObject]()
        if let start_time = start_time {
            json["start_time"] = start_time as AnyObject?
        }
        if let end_time = end_time {
            json["end_time"] = end_time as AnyObject?
        }
        if let thumbnail_url = thumbnail_url {
            json["thumbnail_url"] = thumbnail_url as AnyObject?
        }
        return json
    }
    
}
