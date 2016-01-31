//
//  Alarm.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import Foundation
import UIKit

class Alarm : NSObject, NSCoding {
    //variables for alarm
    var isActive: Bool
    var name: String
    var time: NSDate
    let alarmColor = UIColor.blueColor()
    var vibrate: Bool
    var snooze: Int
    //var device: String
    var media: String
    
    //extra variables for display in list
    var daysShort: String //short values of days
    var timeShort: String //display value of time
    
    //global constants for keys used to identify data for archiving
    let IsActiveKey = "isActiveKey"
    let NameKey = "nameKey"
    let TimeKey = "timeKey"
    let AlarmColorKey = "alarmColorKey"
    let VibrateKey = "vibrateKey"
    let SnoozeKey = "snoozeKey"
    //let DeviceKey = "deviceKey"
    let MediaKey = "mediaKey"
    let DaysShortKey = "daysShortKey"
    let TimeShortKey = "timeShortKey"
    
    // FIXME: not correctly initializing - written like this to compile
    override init() {
        self.isActive = true
        self.name = "New Alarm"
        self.time = NSDate()
        self.vibrate = true
        self.snooze = 0
        //self.device = "Default"
        self.media = "Default"
        
        self.daysShort = "day"
        self.timeShort = "11:65jm"
    }
    
    // FIXME: not correctly initializing
    //init for creating alarm item
    init(isActive: Bool, name: String, time newTime: NSDate, vibrate: Bool, snooze: Int, media: String, daysShort: String, timeShort: String) {
        self.isActive = isActive
        self.name = name
        self.time = newTime
        self.vibrate = vibrate
        self.snooze = snooze
        //self.device = "Default"
        self.media = media
        
        self.daysShort = daysShort
        self.timeShort = timeShort
    }
    
    required init?(coder aDecoder: NSCoder) {
        isActive = aDecoder.decodeObjectForKey(IsActiveKey) as! Bool
        name = aDecoder.decodeObjectForKey(NameKey) as! String
        time = aDecoder.decodeObjectForKey(TimeKey) as! NSDate
        vibrate = aDecoder.decodeObjectForKey(VibrateKey) as! Bool
        snooze = aDecoder.decodeObjectForKey(SnoozeKey) as! Int
        //device = aDecoder.decodeObjectForKey(DeviceKey) as! String
        media = aDecoder.decodeObjectForKey(MediaKey) as! String
        daysShort = aDecoder.decodeObjectForKey(DaysShortKey) as! String
        timeShort = aDecoder.decodeObjectForKey(TimeShortKey) as! String
    }
    
    func encodeWithCoder(coder: NSCoder) {
        coder.encodeObject(isActive, forKey: IsActiveKey)
        coder.encodeObject(name, forKey: NameKey)
        coder.encodeObject(time, forKey: TimeKey)
        coder.encodeObject(vibrate, forKey: VibrateKey)
        coder.encodeObject(snooze, forKey: SnoozeKey)
        //coder.encodeObject(device, forKey: DeviceKey)
        coder.encodeObject(media, forKey: MediaKey)
        coder.encodeObject(daysShort, forKey: DaysShortKey)
        coder.encodeObject(timeShort, forKey: TimeShortKey)
    }
}