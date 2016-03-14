//
//  addEvent.swift
//  HW2
//
//  Created by Eli Maczuzak on 3/12/16.
//  Copyright © 2016 Eli Maczuzak. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class addEvent: UIViewController {
    
    //Controls title and date instances
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDate: UIDatePicker!
    
    //Stores info for date and time as a string
    var dateString = ""
    
    //Holds array of events stored as strings
    var arr : [String] = [];
    
    //Currently dismissing the keyboard. Ran into a bug where I could not get out of it from the simulator.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Sets date string using info from datepicker
    @IBAction func setDate(sender: AnyObject) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateString = formatter.stringFromDate(eventDate.date)
    }
    
    //Adds events to log
    @IBAction func Submit(sender: AnyObject) {
        arr = [eventTitle.text!, dateString, String(count)]
        data.setValue(arr, forKey: "event " + String(count))
        events.append(eventTitle.text! + ": " + dateString + "-->" + String(count))
        ++count
        tmp = count
        
        
        data.setValue(count, forKey: "count")
        data.synchronize()
    }

}