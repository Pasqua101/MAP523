//
//  ViewController.swift
//  counterAppPratice
//
//  Created by user256704 on 2/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    
    var counterValue: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func onDecreaseButtonClicked(_ sender: UIButton) {
        counterValue = counterValue - 1
        counterLabel.text = counterValue.description
    }
    
    
    @IBAction func onIncreaseButtonClicked(_ sender: UIButton) {
        counterValue = counterValue + 1
        counterLabel.text = counterValue.description
    }
}

