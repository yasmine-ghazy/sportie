//
//  League.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
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

struct Leagues: Codable{
    var countrys : [League]!
}

struct League: Codable, Manageable{
    var idLeague : String!
    var strLeague : String!
    var strBadge : String!
    var strYoutube : String!
    var isFav: Bool!

    init(idLeague : String, strLeague : String, strBadge : String, strYoutube : String, isFav: Bool){
        self.idLeague = idLeague
        self.strLeague = strLeague
        self.strBadge = strBadge
        self.strYoutube = strYoutube
    }
    
    init(fromManagedObject managedObject: NSManagedObject) {
        idLeague = managedObject.value(forKey: "idLeague") as? String
        strLeague = managedObject.value(forKey: "strLeague") as? String
        strBadge = managedObject.value(forKey: "strBadge") as? String
        strYoutube = managedObject.value(forKey: "strYoutube") as? String
    }
    
    func toManagedObject(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) -> NSManagedObject {
        let managedObject = NSManagedObject(entity: entity, insertInto: context)
        managedObject.setValue(idLeague, forKey: "idLeague")
        managedObject.setValue(strLeague, forKey: "strLeague")
        managedObject.setValue(strBadge, forKey: "strBadge")
        managedObject.setValue(strYoutube, forKey: "strYoutube")
        return managedObject
    }
}

/*
League Details by Id
https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=4346
*/

/**
 All Leagues for sport
 https://www.thesportsdb.com/api/v1/json/1/all_leagues.php?s=Soccer
 */



/*
 https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=Soccer
 */
