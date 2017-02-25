//
//  Montage.swift
//
//  Created by Kei Sakaguchi on 2/25/17.
//

import Foundation
import SwiftyJSON
import Firebase

class Montage {
    
    var montage_id: String?
    var yt_url: String?
    var title: String?
    var desc: String?
    var author: String? // name of author
    var clips = [Clip]()
    
    
    init() {
//        self.montage_id = "1234"
//        self.yt_url = "http://www.yahoo.com"
//        self.title = "some title"
//        self.desc = "description"
//        self.author = "kei"
    }
    
    init(dict: NSDictionary) {
        self.montage_id = dict["montage_id"] as? String
        self.yt_url = dict["yt_url"] as? String
        self.title = dict["title"] as? String
        self.desc = dict["desc"] as? String
        self.author = dict["author"] as? String
        
        for (index, clipDict) in dict["clips"] as! NSDictionary {
            print("\(index) resp: \(clipDict)")
            //instantiate, check if nil, then append
            clips.append(Clip(json: clipDict as! JSON))
        }
    }

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
    
    // maybe even have a callback
    // updates the database
    func update() {
        
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

extension Montage {
    
    static func addMontage(montage: Montage, user_id: String, completionHandler: @escaping (NSError?) -> Void) {
        let ref = FIRDatabase.database().reference()
        ref.child(user_id).setValue(montage.toJSON())

        completionHandler(nil)
    }
    
    static func fetchMontage(user_id: String, completionHandler: @escaping (Montage?, NSError?) -> Void) {
        let ref = FIRDatabase.database().reference()
        ref.child(user_id).observeSingleEvent(of: .value, with: { snapshot in
            if let dict = snapshot.value as? NSDictionary {
                print(dict)
                completionHandler(Montage(dict: dict), nil)
            }
        }) { err in
            print("error: \(err)")
        }

        completionHandler(nil, nil)
    }
}
