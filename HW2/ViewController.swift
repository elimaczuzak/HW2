//
//  ViewController.swift
//  HW2
//
//  Created by Eli Maczuzak on 3/12/16.
//  Copyright © 2016 Eli Maczuzak. All rights reserved.
//

import UIKit
import EventKit

//Global variables:
var count = 0; //used as counter for number of events
var events: [String] = []; //Stores current log of events
var tmp = 0; //utility integer for interaction between classes
var bootCount = 0; //checks to see if program has been loaded up before


var data = NSUserDefaults.standardUserDefaults()

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        data.synchronize()
        
        if let key = data.objectForKey("count") {
            count = Int(key as! NSNumber);
        }
    
    
        if bootCount == 0 {
            for (var i = 0; i < count; ++i) {
                if data.objectForKey("event " + String(i)) != nil {
                    //let name = "event " + String(i)
                    let title = String(data.objectForKey("event " + String(i))![0])
                    let date = String(data.objectForKey("event " + String(i))![1])
                    let eventNum = String(data.objectForKey("event " + String(i))![2])
                    events.append(title + ": " + date + "--> " + eventNum)
                    tmp = count
                }
            }
        } else {
            for (var i = tmp; i < count; ++i){
                //let name = "event " + String(i)
                let title = String(data.objectForKey("event " + String(i))![0])
                let date = String(data.objectForKey("event " + String(i))![1])
                let eventNum = String(data.objectForKey("event " + String(i))![2])
                events.append(title + ": " + date + "--> " + eventNum)
                events.append(title + ": " + date)
            }
            tmp = count
        }
    
        ++bootCount
        data.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

