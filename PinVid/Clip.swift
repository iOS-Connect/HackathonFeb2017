//
//  Clip.swift
//
//  Created by Kei Sakaguchi on 2/25/17.
//

import Foundation
import SwiftyJSON

class Clip: CustomStringConvertible{
    
    var start_time: Int?
    var end_time: Int?
    var thumbnailNameId: String?
    
    
    init(dict: NSDictionary) {
        self.start_time = dict["start_time"] as! Int
        self.end_time = dict["end_time"] as! Int
        self.thumbnailNameId = dict["thumbnail_url"] as? String
    }
    
    init(json: SwiftyJSON.JSON) {
        self.start_time = json["start_time"].int
        self.end_time = json["end_time"].int
        self.thumbnailNameId = json["thumbnail_url"].string
    }
    
    init(startTime: Int, endTime: Int, thumbNailUrl: String?) {
        self.start_time = startTime
        self.end_time = endTime
        self.thumbnailNameId = thumbNailUrl
    }
    
    var description: String {
        return "Start time: \(String(describing: start_time))" +
               " End time: \(String(describing: end_time))" +
               " Thumbnail URL: \(String(describing: thumbnailNameId))"
    }
    
    func toJSON() -> [String: AnyObject] {
        var json = [String: AnyObject]()
        if let start_time = start_time {
            json["start_time"] = start_time as AnyObject?
        }
        if let end_time = end_time {
            json["end_time"] = end_time as AnyObject?
        }
        if let thumbnailNameId = thumbnailNameId {
            json["thumbnailNameId"] = thumbnailNameId as AnyObject?
        }
        return json
    }
    
}
