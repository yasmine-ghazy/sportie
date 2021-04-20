//
//  MovieLocalDataSource.swift
//  Day5
//
//  Created by Yasmine Ghazy on 05/04/2021.
//  Copyright © 2021 Yasmine Ghazy. All rights reserved.
//

import Foundation
import CoreData

class FavoriteLocalDataSource: FavoriteDataSource {

    //MARK: - Properties
    static let shared: FavoriteDataSource = FavoriteLocalDataSource()
    private var entityName = "FavouriteLeague"
    private var entity: NSEntityDescription?
    
    //MARK: - Initalizer
    private init() {
        if let managedContext = CoreDataDatabase.shared.getContext(){
            entity =  NSEntityDescription.entity(forEntityName: entityName,
                                                 in: managedContext)
        }
    }
    
    //MARK: - MovieDataSource
    
    func addFavourite(league: League) -> Bool {
        if let entity = entity{
            let _ = league.toManagedObject(entity: entity, insertInto: CoreDataDatabase.shared.getContext())
            return CoreDataDatabase.shared.saveContext()
               
            
        }
        return false
    }
    
    func deleteFavourite(leagueId: String) -> Bool {
        let fetchRequest: NSFetchRequest<FavouriteLeague> = FavouriteLeague.fetchRequest()
        fetchRequest.predicate = NSPredicate.init(format: "idLeague = %@",leagueId)
        if let objects = try? CoreDataDatabase.shared.getContext()?.fetch(fetchRequest){
            for obj in objects {
                CoreDataDatabase.shared.getContext()?.delete(obj)
            }
            return CoreDataDatabase.shared.saveContext()
        }
        return false
    }
    
    func getFavouriteLeagues() -> [League] {
        let leagueFetch = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeague")
        do{
            if let leagues =  try CoreDataDatabase.shared.getContext()?.fetch(leagueFetch){
                return leagues.map(){ (managedObject) -> League in
                    League(fromManagedObject: managedObject)
                }
            }
        }catch(let error){
            print(error)
        }
        
        return []
    }
    
    func deleteAllLeagues() -> Bool {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try CoreDataDatabase.shared.getContext()?.execute(deleteRequest)
            return true
        } catch let error {
            // TODO: handle the error
            print("Could not delete. \(error)")
        }
    
        return false
    }
  
}




/*
 //MARK: - MovieDataSource
 func addMovie(item: Movie) {
     if let entity = entity{
         let movie = NSManagedObject(entity: entity, insertInto: CoreDataDatabase.shared.getContext())
         movie.setValuesForKeys(item.toDictionary())
         CoreDataDatabase.shared.saveContext()
     }
 }
 
 func deleteMovie(title: String) {
     
     let fetchRequest: NSFetchRequest<Movies> = Movies.fetchRequest()
     fetchRequest.predicate = NSPredicate.init(format: "title = %@",title)
     if let objects = try? CoreDataDatabase.shared.getContext()?.fetch(fetchRequest){
         for obj in objects {
             CoreDataDatabase.shared.getContext()?.delete(obj)
         }
         CoreDataDatabase.shared.saveContext()
     }

     
 }
 
 func getMovies( completion: @escaping ( (Array<Movie>) -> () )){
           let fetchRequest =
             NSFetchRequest<NSManagedObject>(entityName: entityName)
             if let itemsList = try! CoreDataDatabase.shared.getContext()?.fetch(fetchRequest){
                 completion(itemsList.map({ (obj) -> Movie in
                     let keys = Array(obj.entity.attributesByName.keys)
                     return Movie(fromDictionary: obj.dictionaryWithValues(forKeys: keys))
                 }))
             }else{
               print("Could not fetch. ")
             }
         CoreDataDatabase.shared.saveContext()
 }
 
 func deleteAll(){
     let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: entityName)
     let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

     do {
         try CoreDataDatabase.shared.getContext()?.execute(deleteRequest)
     } catch let error {
         // TODO: handle the error
         print("Could not delete. \(error)")
     }
 }

}

 */
