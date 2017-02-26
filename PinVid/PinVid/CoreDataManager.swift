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
    
    func addClip(startTime: Double, endTime: Double) {

        let managedContext = persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "ClipData", in: managedContext)
        
        let clip = NSManagedObject(entity: entity!, insertInto: managedContext)
        
        clip.setValue(startTime, forKey: "start_time")
        clip.setValue(endTime, forKey: "end_time")
        clip.setValue("TgqiSBxvdws", forKey: "thumbnail_url")
        
        
    }
    
    ///Featch all video when app opens
    func fetchClip() -> [NSManagedObject] {
        
        let managedContext = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ClipData")
        do {
            return try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        
        return [NSManagedObject]()
    }
    
}
