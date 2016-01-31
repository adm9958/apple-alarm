//
//  AlarmsManager.swift
//  AppleAlarm
//
//  Created by Alexander McLean on 1/30/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//

import Foundation

class AlarmsManager {
    var alarms = [Alarm]()
    
    lazy private var archivePath: String = {
        let fileManager = NSFileManager.defaultManager()
        let documentsDirectoryURLs = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let archiveURL = documentsDirectoryURLs.first!.URLByAppendingPathComponent("AppleAlarm", isDirectory: false)
        
        return archiveURL.path!
    }()
    
    init() {
        unarchiveSavedAlarms()
    }
    
    func save() {
        NSKeyedArchiver.archiveRootObject(alarms, toFile: archivePath)
    }
    
    private func unarchiveSavedAlarms() {
        if NSFileManager.defaultManager().fileExistsAtPath(archivePath) {
            let savedAlarms = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath) as! [Alarm]
            alarms = savedAlarms
        }
    }
}