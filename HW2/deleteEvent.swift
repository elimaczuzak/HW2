//
//  deleteEvent.swift
//  HW2
//
//  Created by Eli Maczuzak on 3/12/16.
//  Copyright © 2016 Eli Maczuzak. All rights reserved.
//

import Foundation
import UIKit

class deleteEvent: UIViewController {
    
    
    @IBOutlet weak var table: UITableView!
    var index = -1 //Set index to unused value
    var curr : UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
    var splitArr = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->   UITableViewCell! {
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"cell")
        splitArr = events[indexPath.row].componentsSeparatedByString("-->")
        cell.textLabel?.text = splitArr[0] as! String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        curr = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        index = indexPath!.row
    }

    
    //Checks to make sure that an event is indeed selected and deletes it
    @IBAction func Delete(sender: AnyObject) {
        if index > 0 {
            events.removeAtIndex(index)
            data.removeObjectForKey("event " + String(splitArr[1]))
            data.synchronize()
        }
    }
}