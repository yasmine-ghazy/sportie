//
//  CoreDataDatabase.swift
//  Day7
//
//  Created by Yasmine Ghazy on 11/04/2021.
//

import UIKit
import CoreData

class CoreDataDatabase{
    private var managedContext: NSManagedObjectContext?

    
    //Singelton
    static let shared = CoreDataDatabase()
    private init() {
            self.managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    func getContext()-> NSManagedObjectContext?{
        //Get DB Path
        return managedContext
    }
    
    func saveContext()->Bool{
        do{
            try managedContext?.save()
            return true
        }catch(let error){
            print(error)
            return false
        }
        
    }
    
}

