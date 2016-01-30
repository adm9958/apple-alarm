//
//  Alarm.swift
//  AppleAlarm
//
//  Created by Alexander McLean on 1/30/16.
//  Copyright © 2016 Antar Vasi. All rights reserved.
//

import Foundation

class Alarm : NSObject {
    var name: String
    var time: NSDate
    
    override init() {
        self.name = "New Alarm"
        self.time = NSDate()
    }
    
    init(name: String, time newTime: NSDate) {
        self.name = name
        self.time = newTime
    }
}