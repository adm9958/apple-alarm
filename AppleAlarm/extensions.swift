//
//  extensions.swift
//  AppleAlarm
//
//  Created by Alexander McLean on 1/31/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import Foundation

extension NSDate {
    func hour() -> Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = calendar.components(.Hour, fromDate: self)
        let hour: Int = components.hour
        return hour
    }
    
    func minute() -> Int {
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        let components: NSDateComponents = calendar.components(.Minute, fromDate: self)
        let minute: Int = components.minute
        return minute
    }
    
    func toShortTimeString() -> String {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString: String = formatter.stringFromDate(self)
        return timeString
    }
}