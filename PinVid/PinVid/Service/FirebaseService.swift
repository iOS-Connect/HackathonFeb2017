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
//    class var server:BackupServer {   //computed property
//        struct SingletonWrapper {
//            static let singleton = BackupServer(name:"MainServer");   }
//        return SingletonWrapper.singleton;
//    }
    let ref: FIRDatabaseReference!
    class var shared: FirebaseService {
        struct SingletonService {
            static let singleton = FirebaseService()
        }
        return SingletonService.singleton
    }
    private override init() {
        ref = FIRDatabase.database().reference()
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
