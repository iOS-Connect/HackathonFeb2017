import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let sharedInstance = CoreDataManager()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PinVid")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    

    
    func saveContext() {
//        appDelegate.saveContext()
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func addVideo() {

        
//        let managedContext = appDelegate.persistentContainer.viewContext
        let managedContext = persistentContainer.viewContext
        
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
        
//        let managedContext = appDelegate.persistentContainer.viewContext
        let managedContext = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Video")
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return [NSManagedObject]()
    }
    

}
