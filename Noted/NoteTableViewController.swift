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
    @IBAction func unWindOnCancel(_ unwindSegue: UIStoryboardSegue) {}
    
    
    let dataInterface = DataInterface()
    var notes: [Note] = []
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get notes in storage
        notes = dataInterface.get("Note") as! [Note]
        
        // Create empty state message but dont add to view
        
        label.frame = CGRect(x: 50, y: 50, width: 200, height: 30)
        label.textAlignment = NSTextAlignment.center
        label.center = self.view.center
        label.text = "Add a new note!"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        // If there are no notes, show empty state message
        if (notes.count == 0) {
            self.view.addSubview(label)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get the cell object
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        // Set the cells text label equal to our note text
        cell.textLabel?.text = notes[indexPath.row].noteTitle
        cell.detailTextLabel?.text = DateTime().fmtDate(notes[indexPath.row].dateUpdated!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            
            // Remove deleted note
            dataInterface.delete(notes[indexPath.row])
            notes.remove(at: indexPath.row)
            // Remove from table
            noteTable.deleteRows(at: [indexPath], with: .left)
            
            // If there are no notes, show empty state message
            if (notes.count == 0) {
                self.view.addSubview(label)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Leaving view so remove message if it exists
        label.removeFromSuperview()
        
        // Pass the note object of the selected row to the edit view controller
        if (segue.identifier == "edit") {
            let destination = segue.destination as? EditViewController;
            let cell = sender as! UITableViewCell
            let selectedRow = tableView.indexPath(for: cell)!.row
            destination!.selectedValue = notes[selectedRow]
        }
    }
}
