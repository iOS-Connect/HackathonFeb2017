//
//  FirebaseService.swift
//  PinVid
//
//  Created by Sida Wang on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit
import Firebase

class FirebaseService: NSObject {
    let ref: FIRDatabaseReference!
    let storageRef: FIRStorageReference!
    var userId: String {
        guard let userId = UserDefaults.standard.value(forKey: AppDelegate.Constants.userId) as? String else {
            fatalError("user not login")
        }
        return userId
    }
    
    class var shared: FirebaseService {
        struct SingletonService {
            static let singleton = FirebaseService()
        }
        return SingletonService.singleton
    }
    private override init() {
        ref = FIRDatabase.database().reference()
        storageRef = FIRStorage.storage().reference()

    }
    
    func addMontage(montage: Montage, user_id: String, completionHandler: @escaping (Error?) -> Void) {
        let montage_id = UUID().uuidString
        montage.montage_id = montage_id
        ref.child("users/\(user_id)/montages/\(montage_id)").setValue(montage.toJSON()) { (err, ref) in
            completionHandler(err)
        }
    }

    func fetchMontages(user_id: String, completionHandler: @escaping ([Montage], NSError?) -> Void) {
        ref.child("users/\(user_id)/montages").observeSingleEvent(of: .value, with: { snapshot in
            if let dict = snapshot.value as? NSDictionary {
                print(dict.allValues)
                var montages = [Montage]()
                for montageDict in dict.allValues {
                   
                    montages.append(Montage(dict: montageDict as! NSDictionary))
                    
                }
                completionHandler(montages, nil)
            }
        }) { err in
            print("error: \(err)")
        }
    }
 
}

extension FirebaseService {
    func saveImage(_ imageData: Data, withName name: String) {
        //name format <userid>_<montageid>_<clipsIndex>.png
        let imageName = name
        
        
    }
}















