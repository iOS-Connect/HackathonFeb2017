import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    func addVideo() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Video", in: managedContext)
        
        let video = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        video.setValue("Jay's ID", forKey: "montage_id")
        video.setValue("Jay's URL", forKey: "yt_url")
        video.setValue("Jay's Title", forKey: "title")
        video.setValue("Jay's Desc", forKey: "desc")
        video.setValue("Jay's Author", forKey: "author")
        
    }
    
    ///Featch all video when app opens
    func fetchVideo() -> [NSManagedObject] {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [NSManagedObject]()
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Video")
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return [NSManagedObject]()
    }
    

}
