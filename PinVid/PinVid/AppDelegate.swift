//
//  AppDelegate.swift
//  PinVid
//
//  Created by YupinHuPro on 2/24/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var networkService: NetworkService!
    
    struct Constants {
        static let userId = "kUserId"
    }
    
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        networkService = FirebaseService.shared
        route()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "PinVid")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

extension AppDelegate {
    func route() {
        let vc: UIViewController!
        //show login if not registered.
        if let user = FIRAuth.auth()?.currentUser {
            let storyboard = UIStoryboard(name: "ProfileList", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "ProfileListViewController")
            
            let userid = user.uid
            UserDefaults.standard.set(userid, forKey: AppDelegate.Constants.userId)
            UserDefaults.standard.synchronize()
        } else {
            let storyboard = UIStoryboard(name: "Auth", bundle: nil)
            vc = storyboard.instantiateViewController(withIdentifier: "EmailViewController")

        }
        (window?.rootViewController as! UINavigationController).pushViewController(vc, animated: false)
    }
    
}

@objc protocol AuthDelegate {
    func didLogin(_ user: FIRUser)
}

extension AppDelegate: AuthDelegate {
    func didLogin(_ user: FIRUser) {
        testSaveAndFetch(user)
        route()
    }

    func testSaveAndFetch(_ user: FIRUser) {
        let montage1 = Montage()
        montage1.author = "Kei Sakaguchi"
        montage1.yt_url = "https://www.youtube.com/watch?v=joucE2oAYDY"
        montage1.desc = "This is a test."
        montage1.title = "Kei goes to Dev Camp!"
        montage1.montage_id = "1234ABCD"
        let clip1 = Clip(startTime: 10, endTime: 20, thumbNailUrl: nil)
        let clip2 = Clip(startTime: 20, endTime: 30, thumbNailUrl: nil)
        montage1.clips = [clip1, clip2]
        
        let montage2 = Montage()
        montage2.author = "Max"
        montage2.yt_url = "https://www.youtube.com/watch?v=nS-rnG_DGHA"
        montage2.desc = "This is another test."
        montage2.title = "MAX!"
        montage2.montage_id = "1111AAAA"
        let clip3 = Clip(startTime: 10, endTime: 20, thumbNailUrl: nil)
        let clip4 = Clip(startTime: 20, endTime: 30, thumbNailUrl: nil)
        
        montage2.clips = [clip3, clip4]

        
        //test save image
        clip3.thumbnailNameId = UUID().uuidString
        let placeholderImage = UIImage(named: "placeholder")
        guard let data = UIImagePNGRepresentation(placeholderImage!) else {
            fatalError("convert to png data err")
        }
        
        networkService.saveImage(data, withName: "\(clip3.thumbnailNameId).png", completionHandler: { (downloadUrlStr ,err) in
            print(downloadUrlStr!)
            if let durl = downloadUrlStr {
                clip3.thumbnail_url = durl
                self.networkService.addMontage(montage: montage2, user_id: user.uid, completionHandler: { (err) in
                    if err != nil {
                        print(err!)
                    }
                })
            }
        })
        //test saving
        networkService.addMontage(montage: montage1, user_id: user.uid) { (error) in
            if error != nil {
                print("fail")
                return
            }
            print("yay, it worked")
            self.networkService.fetchMontages(user_id: user.uid) { (montages, err) in
                montages.forEach({
                    print($0)
                })
            }

        }
    }
}


