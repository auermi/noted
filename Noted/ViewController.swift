//
//  ViewController.swift
//  Noted
//
//  Created by Michael Andrew Auer on 1/19/16.
//  Copyright © 2016 Usonia LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableData: [String] = ["One", "Two", "Three"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Render the number of table view cells that we need
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    // Populate the cells with data
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "noteCell")
        cell.textLabel?.text = notes[indexPath.row].note
        return cell
    }
}

