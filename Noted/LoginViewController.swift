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
        
        self.navigationController?.isNavigationBarHidden = true
        
        let dataInterface = DataInterface()
        
        // If a user already exists skip authentication
        let user = dataInterface.get("User") as! [User]
       
        if (user.count == 1) {
            DispatchQueue.main.async() {
                self.performSegue(withIdentifier: "start", sender: nil)
            }
        } else {
        
            let logInButton = TWTRLogInButton { (session, error) in
                if let unwrappedSession = session {
                    // Get id and create user
                    dataInterface.create("User", properties: [
                        "id": unwrappedSession.userID as NSObject
                    ])
//                    print(session?.userName ?? nil ?? "asdf");
                    // Transition to notes table view screen
                    self.performSegue(withIdentifier: "start", sender: nil)
                } else {
                    NSLog("Login error: %@", error!.localizedDescription);
                    let alert = UIAlertController(title: "Authentication Error", message: "There was an error logging into Twitter. Please try again", preferredStyle: UIAlertControllerStyle.alert)
                    let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
                    {
                        (UIAlertAction) -> Void in
                    }
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                    {
                        () -> Void in
                    }
                }
            }
            logInButton.center = self.view.center
            self.view.addSubview(logInButton)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
