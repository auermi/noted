//
//  File.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/15/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation
import CoreData

struct DataInterface {
    
    let moc = DataController().managedObjectContext
    
    func create(_ eName: String, properties: [String: NSObject]) {
        // Set up our entity by selecting the entity and context we're targeting
        var entity: NSManagedObject
        
        if (eName == "User") {
            entity = NSEntityDescription.insertNewObject(forEntityName: eName, into: moc) as! User
        } else if (eName == "Note") {
            entity = NSEntityDescription.insertNewObject(forEntityName: eName, into: moc) as! Note
        } else {
            fatalError("Can't create valid type: \(eName)")
        }
    
        
        //add our data
        for (k, v) in properties {
            entity.setValue(v, forKey: k)
        }
        
        // save the entity
        do {
            try moc.save()
        } catch {
            fatalError("Failure to save context: \(error)")
        }
    }
    func get(_ eName: String) -> NSArray {
        let req = NSFetchRequest<NSManagedObject>(entityName: eName)
        do {
            return try moc.fetch(req) as NSArray
            
        } catch {
            fatalError("Failed to fetch \(eName): \(error)")
        }
    }
    func update(_ object: NSManagedObject) {
        do {
            try object.managedObjectContext?.save()
        } catch {
            fatalError("Failed to save \(object): \(error)")
        }
    }
    func delete(_ object: NSObject) {
        moc.delete(object as! NSManagedObject)
        do {
            try moc.save()
        } catch {
            fatalError("Failed to save \(object): \(error)")
        }
    }
}
