//
//  ViewController.swift
//  counterApp
//
//  Created by user256704 on 2/7/24.
//

import UIKit

class ViewController: UIViewController {

    var counterValue: Int = 0;
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func onDescreaseClicked(_ sender: UIButton) {
        counterValue = counterValue - 1
        counterLabel.text = counterValue.description //convertering into to string
    }
    
    
    
    @IBAction func onIncreaseClicked(_ sender: UIButton) {
        counterValue = counterValue + 1
        counterLabel.text = counterValue.description //converting into string
    }
}

