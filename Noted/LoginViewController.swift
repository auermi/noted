//
//  Login.swift
//  Noted
//
//  Created by Michael Andrew Auer on 3/10/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                // Get id and create user if none exists from id
                
                let dataInterface = DataInterface()
                
                dataInterface.create("User", properties: [
                    "id": unwrappedSession.userID
                ])
                
//                let test = ((dataInterface.get("User") as! [User]).first?.id)! as String
                // Transition to notes table view screen
                self.performSegueWithIdentifier("start", sender: nil)
            } else {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
