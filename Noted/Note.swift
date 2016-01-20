//
//  Note.swift
//  Noted
//
//  Created by Michael Andrew Auer on 1/19/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import Foundation

class Note {
    let dateCreated: NSDate
    var dateUpdated: NSDate
    var note: String
    
    init(note:String = "") {
        self.dateCreated = NSDate()
        self.dateUpdated = NSDate()
        self.note = note
    }
}