//
//  FeedbackController.swift
//  Assignment1
//
//  Created by user256704 on 1/31/24.
//

import UIKit

class FeedbackController: UIViewController {

    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reasonTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSwitch: UISwitch!
    
    @IBOutlet weak var ratingStepper: UIStepper!
    
    @IBAction func ratingStepperChanged(_ sender: UIStepper) {
        
        let value = sender.value // Getting the value of the stepper
        
        ratingLabel.text = "(" + String(format: "%d", Int(value)) + "/5)" //Setting the value to the label
    }
    
    @IBAction func emailCopySwitchChanged(_ sender: UISwitch) { //Displays or hides email fields based on if the switch is active or not
        emailLabel.isHidden = !sender.isOn
        emailTextField.isHidden = !sender.isOn
    }
    
    
    @IBAction func onSubmitButtonClicked(_ sender: Any) { //Displays an alert based on what fields are met, otherwise send confirmation and clear fields

        
        if (emailTextField.text?.isEmpty == true && emailTextField.isHidden == false){
            let alert = UIAlertController(title: "Error", message: "Please enter a email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            //Send confirmation alert and clear all fields
            let alert = UIAlertController(title: "Confirmation", message: "Thank you for your response", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            emailTextField.text = ""
            emailSwitch.isOn = false
            ratingStepper.value = 1
            reasonTextField.text = ""
            ratingLabel.text = "(1/5)"
            emailLabel.isHidden = true
            emailTextField.isHidden = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
