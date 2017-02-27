//
//  SettingsViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 6/21/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBAction func signoutButton(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Log Out Confirmation", message: "Are you sure you want to log out?", preferredStyle: UIAlertControllerStyle.alert)
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
