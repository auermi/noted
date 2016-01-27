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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Get rid of that blank space at the top of the text view
        self.automaticallyAdjustsScrollViewInsets = false
        // Set the value of the text field to the note that we clicked on in the table view
        noteTextField.text = selectedValue?.note
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "save") {
            // If we have a note object update it, if not append a new one
            if (selectedValue == nil) {
                notes.append(Note(note: noteTextField.text!))
            } else {
                selectedValue?.note = noteTextField.text!
            }
        }
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
