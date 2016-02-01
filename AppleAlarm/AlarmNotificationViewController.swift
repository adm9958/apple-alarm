//
//  AlarmNotificationViewController.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/31/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import UIKit

class AlarmNotificationViewController: UIViewController {

    @IBOutlet weak var ImageGIF: UIImageView!
    
    @IBAction func dismiss(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        //let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        //appDelegate?.window?.rootViewController = ListViewController()
    }
}
