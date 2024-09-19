//
//  EmpTableViewCell.swift
//  TableViewCellsReview
//
//  Created by user256704 on 4/13/24.
//

import UIKit

class EmpTableViewCell: UITableViewCell {

    @IBOutlet weak var empNameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    
    
    var transferEmployee: (() -> ()) = {}
    
    @IBAction func transferEmployee(_ sender: Any) {
        transferEmployee()
    }
}
