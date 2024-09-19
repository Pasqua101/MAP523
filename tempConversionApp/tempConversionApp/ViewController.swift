//
//  ViewController.swift
//  tempConversionApp
//
//  Created by user256704 on 2/7/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onFahrenhietClicked(_ sender: UIButton) {
        if let celsiusText = tempTextField.text, let celsius = Double(celsiusText) {
                    let fahrenheit = (celsius * 9 / 5) + 32
                    
                    resultLabel.text = String(fahrenheit)
                } else {
                    // Handle invalid input
                    print("Invalid temperature value")
                }
    }
    
    @IBAction func onCelsiusClicked(_ sender: UIButton) {
        if let fahrenheitText = tempTextField.text, let fahrenheit = Double(fahrenheitText) {
                    let celsius = (fahrenheit - 32) * 5 / 9
                    
                    resultLabel.text = String(celsius)
                } else {
                    // Handle invalid input
                    print("Invalid temperature value")
                }
    }
}

