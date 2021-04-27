//
//  League.swift
//  sportie
//
//  Created by Yasmine Ghazy on 18/04/2021.
//

import Foundation
import CoreData


struct Leagues: Codable{
    var countrys : [League]!
}

struct League: Codable, Manageable{
    var idLeague : String!
    var strLeague : String!
    var strBadge : String!
    var strYoutube : String!
    var isFav: Bool! = false

    init(idLeague : String, strLeague : String, strBadge : String, strYoutube : String, isFav: Bool){
        self.idLeague = idLeague
        self.strLeague = strLeague
        self.strBadge = strBadge
        self.strYoutube = strYoutube
        self.isFav = false
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
