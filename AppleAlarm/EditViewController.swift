//
//  EditViewController.swift
//  AppleAlarm
//
//  Created by Gabriel Mara Isserlis on 1/31/16.
//  Copyright © 2016 Antar Vasi, Alexander McLean, Gabriel Isserlis. All rights reserved.
//
/**
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

class EditViewController: UIViewController {
    
    let hourPanRec = UIPanGestureRecognizer()
    let minPanRec = UIPanGestureRecognizer()
    
    var yPixel: CGFloat = 10
    var alarmBlueColor = UIColor(netHex:0x2096F3)
    var dayBtns: [UIButton] = [UIButton]()
    var newItem: Alarm?
}

override func viewDidLoad() {
    print(UIDevice.currentDevice().name)
    super.viewDidLoad()
    dayBtns += [monBtn, tueBtn, wedBtn, thuBtn, friBtn, satBtn, sunBtn]
    // Do any additional setup after loading the view, typically from a nib.
    
    hourPanRec.addTarget(self, action: "hourDraggedView:")
    hourTF.addGestureRecognizer(hourPanRec)
    hourTF.userInteractionEnabled = true
    hourTF.text = "10"
    
    minPanRec.addTarget(self, action: "minuteDraggedView:")
    minuteTF.addGestureRecognizer(minPanRec)
    minuteTF.userInteractionEnabled = true
    minuteTF.text = "00"
    
    deviceName.text = UIDevice.currentDevice().name
    
}

func hourDraggedView(sender:UIPanGestureRecognizer){
    //self.view.bringSubviewToFront(sender.view)
    let translation = sender.translationInView(sender.view)//self.view)
    switch(sender.state){
    case UIGestureRecognizerState.Began:
        fallthrough
        
    case UIGestureRecognizerState.Changed:
        hourTF.textColor = alarmBlueColor
        yPixel += -translation.y / 300
        yPixel = max(0.0, yPixel)
        yPixel = min(12.0, yPixel)
        //print("hour: ", yPixel)
        
        hourTF.text = String(format: "%02d",Int(floor(yPixel)))
        
    default:
        hourTF.textColor = UIColor.blackColor()
        //print("ended")
    }
}

func minuteDraggedView(sender:UIPanGestureRecognizer){
    //self.view.bringSubviewToFront(sender.view)
    let translation = sender.translationInView(sender.view)//self.view)
    switch(sender.state){
    case UIGestureRecognizerState.Began:
        fallthrough
        
    case UIGestureRecognizerState.Changed:
        minuteTF.textColor = alarmBlueColor
        yPixel += -translation.y / 150
        yPixel = max(0.0, yPixel)
        yPixel = min(59.0, yPixel)
        //print("hour: ", yPixel)
        
        minuteTF.text = String(format: "%02d",Int(floor(yPixel)))
        
    default:
        minuteTF.textColor = UIColor.blackColor()
        //print("ended")
    }
}


override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    var timeShort = "";
    var days = "";
    var vibrateBool: Bool
    var snoozeBool: Bool
    let time: NSDate = NSDate()
    //let dateFormatter = NSDateFormatter()
    //dateFormatter.dateFormat = "hh:mm"
    //let date = dateFormatter.dateFromString(
    if segue.identifier == "DoneItem" {
        
        timeShort = hourTF.text! + ":" + minuteTF.text! + timeOfDay
        if let alarmName: String = alarmTitleTF.text {
            for i in dayBtns {
                if i.selected {
                    days += (i.titleLabel?.text)! + " "
                }
            }
            if vibrateSwitch.enabled {
                vibrateBool = true
            }
            
            if snoozeSwitch.enabled {
                snoozeBool = true
            }
            
            if !alarmName.isEmpty {
                newItem = Alarm(isActive: true, name: alarmName, time: time, vibrate: vibrateBool, snooze: snoozeBool, media: "default", daysShort: days, timeShort: timeShort)
            }
        }
    }
    print(days)
    
    //get all buttons that are enabled
    //create a new alarm item using all attributes
}
}
*/


