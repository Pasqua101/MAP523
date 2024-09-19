//
//  ViewController.swift
//  colourPicker
//
//  Created by user256704 on 2/20/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var selectedColourLabel: UILabel!
    @IBOutlet weak var colourPicker: UIPickerView!
    var colours = ["Blue", "Red", "Green", "Orange", "Yellow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    // Datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1 // return num of columns needed
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // return num of rows needed
        return colours.count
    }
    
    // Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colours[row] // return the title for each row
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // when a row is selected, set the set lable to display the selected row
        selectedColourLabel.text = "Selected colour: " + colours[row]
    }
}

