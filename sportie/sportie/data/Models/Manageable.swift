//
//  Manageable.swift
//  sportie
//
//  Created by Yasmine Ghazy on 27/04/2021.
//

import Foundation
import CoreData

protocol Manageable {
    /**
     * Instantiate the instance using the passed NSManagedObject values to set the properties values
     */
    init(fromManagedObject managedObject: NSManagedObject)

    /**
     * Returns all the available property values in the form of NSManaged object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toManagedObject(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) -> NSManagedObject


}
