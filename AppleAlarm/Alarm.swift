//
//  Alarm.swift
//  AppleAlarm
//
//  Created by Alexander McLean on 1/30/16.
//  Copyright © 2016 Antar Vasi. All rights reserved.
//

import Foundation

class Alarm : NSObject {
    var time: NSDate
    
    override init() {
        self.time = NSDate()
    }
    
    init(time: NSDate) {
        self.time = time
    }
}