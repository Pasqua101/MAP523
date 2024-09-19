//
//  ViewController.swift
//  FirstApp
//
//  Created by user254601 on 1/15/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var buttonLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showSomething(_ sender: Any) {
        buttonLabel.text = userTextField.text
    }

}

