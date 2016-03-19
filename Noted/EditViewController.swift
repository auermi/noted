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
    
    var selectedValue: Note!
    let dataInterface = DataInterface()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get rid of that blank space at the top of the text view
        self.automaticallyAdjustsScrollViewInsets = false
        
        if (selectedValue != nil) {
            // Set the value of the text field to the note that we clicked on in the table view
            noteTextField.text = selectedValue?.note
            self.navigationController?.topViewController!.title = "Edit Note"
        } else {
            self.navigationController?.topViewController!.title = "New Note"
        }
        // Hide the back button
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "save") {
            // If we have a note object update it, if not create a new one
            if (selectedValue == nil) {
                let df = NSDateFormatter()
                df.dateFormat = "yyyy-MM-dd HH:mm:ss"
                dataInterface.create("Note", properties: [
                    "note": noteTextField.text!,
                    "dateUpdated": df.stringFromDate(NSDate())
                ])
            } else {
                selectedValue?.note = noteTextField.text!
                let df = NSDateFormatter()
                df.dateFormat = "yyyy-MM-dd HH:mm:ss"
                selectedValue?.dateUpdated = df.stringFromDate(NSDate())
                dataInterface.update(selectedValue)
            }
        }
    }
}
