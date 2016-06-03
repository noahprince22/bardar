//
//  ReportCell.swift
//  Bardar
//
//  Created by Noah Prince on 6/2/16.
//  Copyright © 2016 Noah Prince. All rights reserved.
//

import UIKit

class ReportCell: UITableViewCell {
    @IBOutlet weak var submit: UIButton!
    var submitFn: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func onSubmit(fn: () -> ()) {
        submitFn = fn
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func submitClicked(sender: UIButton) {
        submitFn!()
    }
}
