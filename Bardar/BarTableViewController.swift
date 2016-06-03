//
//  BarTableViewController.swift
//  Bardar
//
//  Created by Noah Prince on 6/2/16.
//  Copyright © 2016 Noah Prince. All rights reserved.
//

import UIKit

class BarTableViewController: UITableViewController {
    var bars = [Bar]()
    
    var expanded = false // Indicates a rating is currently expanded
    var insertIndex = -1; // indicates no expanded bar
    
    func expandAtIndex(index: Int) {
        // position to start to insert rows.
        insertIndex = index + 1
        let indices = [NSIndexPath(forRow: insertIndex, inSection: 0)]
        
        // insert the new rows
        self.tableView.beginUpdates()
        self.tableView.insertRowsAtIndexPaths(indices, withRowAnimation: UITableViewRowAnimation.Fade)
        expanded = true
        self.tableView.endUpdates()
    }
    
    func retract() {
        if (expanded) {
            let indices = [NSIndexPath(forRow: insertIndex, inSection: 0)]

            self.tableView.beginUpdates()
            
            self.tableView.deleteRowsAtIndexPaths(indices, withRowAnimation: UITableViewRowAnimation.Fade)
            insertIndex = -1
            expanded = false
            
            self.tableView.endUpdates()
        }
    }
    
    func updateAtIndex(index: Int) {
        var indexToChange = index
        
        if (insertIndex == index) {
            return // do nothing
        }
        // After retracting, our index will be decreased if the retracted index was lower in the list
        else if (expanded && insertIndex < index) {
            indexToChange -= 1
        }
        
        retract()
        expandAtIndex(indexToChange)
    }
    
    override func viewDidLoad() {
        bars = [Bar](count: 2, repeatedValue: Bar())
        super.viewDidLoad();
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expanded ? bars.count + 1 : bars.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        updateAtIndex(indexPath.row)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row == insertIndex) {
            let reportCell = tableView.dequeueReusableCellWithIdentifier("ReportCell", forIndexPath: indexPath) as! ReportCell
            reportCell.onSubmit({ () -> () in
                self.retract()
            })
            
            return reportCell
        } else {
            return tableView.dequeueReusableCellWithIdentifier("BarCell", forIndexPath: indexPath)
        }
    }
}
