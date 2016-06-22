//
//  EditViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 1/23/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var noteTextField: UITextView!
    @IBOutlet weak var noteTitleField: UITextField!
    
    var selectedValue: Note!
    let dataInterface = DataInterface()
    
    var user: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get rid of that blank space at the top of the text view
        self.automaticallyAdjustsScrollViewInsets = false
        
        if (selectedValue != nil) {
            // Set the value of the text field to the note that we clicked on in the table view
            noteTitleField.text = selectedValue?.noteTitle
            noteTextField.text = selectedValue?.note
            self.navigationController?.topViewController!.title = "Edit Note"
        } else {
            self.navigationController?.topViewController!.title = "New Note"
        }
        // Hide the back button
        self.navigationItem.setHidesBackButton(true, animated: false)
        user = dataInterface.get("User") as! [User]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "save") {
            // If we have a note object update it, if not create a new one
            if (selectedValue == nil) {
                dataInterface.create("Note", properties: [
                    "note": noteTextField.text!,
                    "noteTitle": noteTitleField.text!,
                    "dateUpdated": DateTime().setDate(),
                    "userID": (user.first?.id)!
                ])
            } else {
                selectedValue?.note = noteTextField.text!
                selectedValue?.noteTitle = noteTitleField.text!
                selectedValue?.dateUpdated = DateTime().setDate()
                dataInterface.update(selectedValue)
            }
        }
    }
}
