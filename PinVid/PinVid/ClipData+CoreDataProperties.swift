//
//  ClipData+CoreDataProperties.swift
//  PinVid
//
//  Created by YupinHuPro on 2/25/17.
//  Copyright © 2017 SantaClaraiOSConnect. All rights reserved.
//

import Foundation
import CoreData


extension ClipData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClipData> {
        return NSFetchRequest<ClipData>(entityName: "ClipData");
    }

    @NSManaged public var end_time: Int16
    @NSManaged public var start_time: Int16
    @NSManaged public var thumbnail_url: String?

}
