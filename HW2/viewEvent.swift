//
//  viewEvent.swift
//  HW2
//
//  Created by Eli Maczuzak on 3/12/16.
//  Copyright © 2016 Eli Maczuzak. All rights reserved.
//

import Foundation
import UIKit
import EventKit


class viewEvent: UIViewController {
    
    var temp = 0
    var dateString = ""
    var counter = 0
    
    @IBOutlet weak var presentText: UITextView!
    @IBOutlet weak var EventDate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func DateChosen(sender: AnyObject) {
        presentText.text = ""
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy" //DateFormatter is not displaying in this way. I don't know why.
        dateString = dateFormatter.stringFromDate(EventDate.date)
        
        //Displays events if there are any
        if count > 0 {
            for var i = 0; i < events.count; ++i {
                let date = events[i]
                let index = date.endIndex.advancedBy(-10)
                let substring = date.substringToIndex(index)
                var splitArr = substring.componentsSeparatedByString(": ")
                let eventDate = splitArr[1].stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                if (dateString == eventDate) {
                    presentText.text = presentText.text + splitArr[0] + ": " + splitArr[1] + "\n"
                }
            }
        } else {
            //Sets text if no events are present
            presentText.text = "No events for this day, yet"
        }
    }
}