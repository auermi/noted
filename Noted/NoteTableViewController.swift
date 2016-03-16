//
//  NoteTableViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 1/23/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    // TODO: Might be temporary. Look into reloading tableview without needing this
    @IBOutlet var noteTable: UITableView!
    
    var dataInterface = DataInterface()
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get notes in storage
        notes = dataInterface.get("Note") as! [Note]
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get the cell object
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        // Set the cells text label equal to our note text
        cell.textLabel?.text = notes[indexPath.row].note
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            // Remove deleted note
            dataInterface.delete(notes[indexPath.row])
            notes.removeAtIndex(indexPath.row)
            // Remove from table
            noteTable.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Left)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Pass the note object of the selected row to the edit view controller
        if (segue.identifier == "edit") {
            let destination = segue.destinationViewController as? EditViewController;
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)!.row
            destination!.selectedValue = notes[selectedRow]
        }
    }
    
}









