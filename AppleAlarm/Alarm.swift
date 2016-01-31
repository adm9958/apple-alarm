//
//  Alarm.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import Foundation
import UIKit

class Alarm : NSObject {
    //variables for alarm
    var isActive: Bool
    var name: String
    var time: NSDate
    let alarmColor = UIColor.blueColor()
    var vibrate: Bool
    var snooze: Int
    var device: String
    var media: String
    
    //extra variables for display in list
    var daysShort: String //short values of days
    var timeShort: String //display value of time
    
    // FIXME: not correctly initializing - written like this to compile
    override init() {
        self.isActive = true
        self.name = "New Alarm"
        self.time = NSDate()
        self.vibrate = true
        self.snooze = 0
        self.device = "Default"
        self.media = "Default"
        
        self.daysShort = ""
        self.timeShort = ""
    }
    
    // FIXME: not correctly initializing
    //init for creating alarm item
    init(name: String, time newTime: NSDate) {
        self.isActive = true
        self.name = name
        self.time = newTime
        self.vibrate = true
        self.snooze = 0
        self.device = "Default"
        self.media = "Default"
        
        self.daysShort = ""
        self.timeShort = ""
    }
    
}