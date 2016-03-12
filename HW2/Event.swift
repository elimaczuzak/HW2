//
//  Event.swift
//  HW2
//
//  Created by Eli Maczuzak on 3/12/16.
//  Copyright © 2016 Eli Maczuzak. All rights reserved.
//

import Foundation

//Object for an Event, contains title and date
class Event: NSObject {
    var _title : String! = ""
    var _date : NSDate!
    
    var title : String {
        get {
            return _title
        } set (newTitle) {
            _title = newTitle
        }
    }
    
    var date : NSDate {
        get {
            return _date
        } set (newDate) {
            _date = newDate
        }
    }
}