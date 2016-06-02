//
//  BarTableViewController.swift
//  Bardar
//
//  Created by Noah Prince on 6/2/16.
//  Copyright © 2016 Noah Prince. All rights reserved.
//

import UIKit

class BarTableViewController: UITableViewController {
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("BarCell", forIndexPath: indexPath)
    }
}
