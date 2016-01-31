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
    var itemsList = [
        Alarm(),
        Alarm(),
        Alarm()]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath)
        let item = itemsList[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        if segue.identifier == "DoneItem" {
            let addVC = segue.sourceViewController as! AddViewController
            if let newItem = addVC.newItem {
                itemsList += [newItem]
                
                let indexPath = NSIndexPath(forRow: itemsList.count - 1, inSection: 0)
                tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            }
        }
    }
}
