//
//  SettingsViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 6/21/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var signoutText: UILabel!
    @IBAction func signoutButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Are you sure you want to log out?", message: "All of your notes will be deleted.", preferredStyle: UIAlertControllerStyle.alert)
        let alertActionConfirm = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (UIAlertAction) in
            // Hitting okay begins the logout process
            let dataInterface = DataInterface()
            // Delete Notes
            let notes: [Note] = dataInterface.get("Note") as! [Note]
            for note in notes {
                dataInterface.delete(note)
            }
            // Delete User
            let user: [User] = dataInterface.get("User") as! [User]
            dataInterface.delete(user.first!)
            // Move Back to Login Page
            self.performSegue(withIdentifier: "signout", sender: nil)
        }
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel)
        {
            (UIAlertAction) -> Void in
        }
        alert.addAction(alertActionConfirm)
        alert.addAction(alertActionCancel)
        self.present(alert, animated: true)
        {
            () -> Void in
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataInterface = DataInterface();
        let user: [User] = dataInterface.get("User") as! [User];
        signoutText.text = "Signed in as \(user.first!.userName!)";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
