//
//  MontageData+CoreDataProperties.swift
//  PinVid
//
//  Created by YupinHuPro on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import Foundation
import CoreData


extension MontageData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MontageData> {
        return NSFetchRequest<MontageData>(entityName: "MontageData");
    }

    @NSManaged public var author: String?
    @NSManaged public var desc: String?
    @NSManaged public var montage_id: String?
    @NSManaged public var title: String?
    @NSManaged public var yt_url: String?

}
