//
//  ListViewController.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Antar Vasi. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    var itemsList = ["Alarm1","myAlarm","Antar's Alarm"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListViewCell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = itemsList[indexPath.row]
        return cell
    }
}
