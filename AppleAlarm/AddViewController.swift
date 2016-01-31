//
//  ViewController.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Gabriel Isserlis. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    //hello
    
    @IBOutlet weak var alarmTitleTF: UITextField!
    
    var newItem: Alarm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "DoneItem" {
            if let name = alarmTitleTF.text {
                if !name.isEmpty {
                    newItem = Alarm()
                }
            }
        }
    }

}

