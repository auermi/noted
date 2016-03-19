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
        // Set the value of the text field to the note that we clicked on in the table view
        noteTextField.text = selectedValue?.note
        
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
                dataInterface.create("Note", properties: [
                    "note": noteTextField.text!
                ])
            } else {
                selectedValue?.note = noteTextField.text!
                dataInterface.update(selectedValue)
            }
        }
    }
}
