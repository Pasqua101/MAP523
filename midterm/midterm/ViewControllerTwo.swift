//
//  ViewControllerTwo.swift
//  midterm
//
//  Created by user256704 on 2/21/24.
//

import UIKit

class ViewControllerTwo: UIViewController {

    var enteredText: String?
    
    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let displayText = enteredText{
            displayLabel.text = displayText
        }
    }
}
