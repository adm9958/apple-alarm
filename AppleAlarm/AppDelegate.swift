//
//  AppDelegate.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/30/16.
//  Copyright © 2016 Gabriel Isserlis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var bgTask: UIBackgroundTaskIdentifier = 0


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.sharedApplication().registerUserNotificationSettings((UIUserNotificationSettings(forTypes: [.Alert, .Sound, .Badge], categories: nil)))
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        bgTask = application.beginBackgroundTaskWithName("CheckCurrentTimeTask", expirationHandler: {
            application.endBackgroundTask(self.bgTask)
            self.bgTask = UIBackgroundTaskInvalid
        })
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            // Do the work
            self.doBackgroundWork()
            
            application.endBackgroundTask(self.bgTask)
            self.bgTask = UIBackgroundTaskInvalid
        })
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func doBackgroundWork() {
        var flag: Bool = false
        // Continuously ping the system for the current date and time
        while !flag {
            let currentDate: NSDate = NSDate()
            let alarmsManager: AlarmsManager = AlarmsManager()
            let curHour: Int = currentDate.hour()
            let curMin: Int = currentDate.minute()
            if let alarms: [Alarm]? = alarmsManager.alarms {
                for a in alarms! {
                    let date: NSDate = a.time
                    let hour: Int = date.hour()
                    let min: Int = date.minute()
                    if date.hour() == currentDate.hour() && date.minute() == currentDate.minute() {
                        flag = true
                        scheduleAlarmForDate(date)
                    }
                }
            }
        }
    }
    
    func scheduleAlarmForDate(date: NSDate) {
        let app: UIApplication = UIApplication.sharedApplication()
        let oldNotifications: [UILocalNotification]? = app.scheduledLocalNotifications
        
        if oldNotifications?.count > 0 {
            app.cancelAllLocalNotifications()
        }
        
        let alarm: UILocalNotification = UILocalNotification()
        alarm.fireDate = date
        alarm.timeZone = NSTimeZone.defaultTimeZone()
        alarm.repeatInterval = NSCalendarUnit(rawValue: 0)
        alarm.soundName = UILocalNotificationDefaultSoundName
        alarm.alertBody = "Your alarm went off on " + date.toShortTimeString()

        app.scheduleLocalNotification(alarm)
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        self.window?.rootViewController = AlarmNotificationViewController()
    }
}

