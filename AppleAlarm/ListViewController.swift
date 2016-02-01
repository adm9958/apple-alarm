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
        let cell = tableView.dequeueReusableCellWithIdentifier("AlarmItemTableViewCell", forIndexPath: indexPath) as! AlarmItemTableViewCell
        let item = alarmsManager.alarms[indexPath.row]
        cell.alarmNameLabel?.text = item.name
        cell.alarmDayLabel?.text = item.daysShort
        cell.alarmTimeLabel?.text = item.timeShort
        cell.alarmSoundLabel?.text = item.media
        
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
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let action = UITableViewRowAction(style: .Normal, title: "Delete") { (Action, Index) -> Void in
            print("delete alarm")
            self.alarmsManager.alarms.removeAtIndex(Index.row)
            self.alarmsManager.save()
            self.tableView.reloadData()
            print(Index)
        }
        action.backgroundColor = UIColor.redColor()
        return [action]
    }
}
