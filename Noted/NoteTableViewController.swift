//
//  NoteTableViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 1/23/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        cell.textLabel?.text = notes[indexPath.row].note
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "edit") {
            let destination = segue.destinationViewController as? EditViewController;
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPathForCell(cell)!.row
            destination!.selectedValue = notes[selectedRow]
        }
    }
    
}
