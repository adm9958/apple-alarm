//
//  ListViewController.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    let alarmsManager = AlarmsManager()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmsManager.alarms.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = alarmsManager.alarms[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController
            if let newItem = addVC.newItem {
                alarmsManager.alarms += [newItem]
                alarmsManager.save()
                
                let indexPath = NSIndexPath(forRow: alarmsManager.alarms.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
}
