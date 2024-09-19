//
//  ViewController.swift
//  tempConverterApp
//
//  Created by user256704 on 2/19/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertToFahrenhiet(_ sender: UIButton) {
        var celsiusTemp: Double? = Double(temperatureTextField.text ?? "0.0") // convert to a double
        
        var fahrenhiet: Double = ((celsiusTemp ?? 0.0) * 9/5) + 32
        
        resultLabel.text = fahrenhiet.description + " degrees fahrenhiet"
    }
    

    @IBAction func convertToCelsius(_ sender: UIButton) {
        var fahrenhietTemp: Double? = Double(temperatureTextField.text ?? "0.0")
        
        var celsius: Double = ((fahrenhietTemp ?? 0.0) - 32) * 5/9
        
        resultLabel.text = celsius.description + " degrees celsius"
    }
}

