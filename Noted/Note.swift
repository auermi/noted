//
//  Note.swift
//  Noted
//
//  Created by Michael Andrew Auer on 2/22/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation
import CoreData


class Note: NSManagedObject {
    // Update moc
    func update() {
        do {
            try self.managedObjectContext?.save()
        } catch {
            fatalError("Failed to save note: \(error)")
        }
    }
    // Delete moc
    func delete() {
        moc.deleteObject(self as NSManagedObject)
        do {
            try moc.save()
            
        } catch {
            fatalError("Failed to save note: \(error)")
        }
    }
}

// Create an instance of the moc
let moc = DataController().managedObjectContext

// Add note in moc
func seedNote(note: String) {
    
    // Set up our entity by selecting the entity and context we're targeting
    let entity = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: moc) as! Note
    
    //add our data
    entity.setValue(note, forKey: "note")
    
    // save the entity
    do {
        try moc.save()
    } catch {
        fatalError("Failure to save context: \(error)")
    }
}
// Get all notes in moc
func fetchNotes() -> [Note] {
    let noteFetch = NSFetchRequest(entityName: "Note")
    
    do {
        return try moc.executeFetchRequest(noteFetch) as! [Note]
        
    } catch {
        fatalError("Failed to fetch note: \(error)")
    }
}
