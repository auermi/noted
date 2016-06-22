//
//  Note+CoreDataProperties.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/15/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Note {

    @NSManaged var note: String?
    @NSManaged var noteTitle: String?
    @NSManaged var dateUpdated: String?
    @NSManaged var userID: String?

}
