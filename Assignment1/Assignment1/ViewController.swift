//
//  ViewController.swift
//  Assignment1
//
//  Created by user256704 on 1/31/24.
//

import UIKit

class ViewController: UIViewController { // The first screen of the register process

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var highSchoolTextField: UITextField!
    @IBOutlet weak var gradeSlider: UISlider!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var gradeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func updateUIElements() { // Used to reset the inputs after the user gets pulled back from screen 3 to here
        nameTextField.text = ""
        ageTextField.text = ""
        highSchoolTextField.text = ""
        gradeSlider.value = 0.0
        gradeLabel.text = "0"
        progressBar.progress = 0.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToRegisterPage2") { //Added an identifier to the seque in the storyboard, check to make sure that it's called here
            if let registerPage2Controller = segue.destination as? RegisterPage2Controller {
                // Passing data to second screen
                registerPage2Controller.name = nameTextField.text
                registerPage2Controller.age = ageTextField.text
                registerPage2Controller.highSchool = highSchoolTextField.text

                // Pass slider and progressBar values
                registerPage2Controller.gradeValue = gradeSlider.value
                registerPage2Controller.progressBarFromFirstScreen = progressBar.progress
                
                //Pass the instance of the controller so we can use updateUIElements
                registerPage2Controller.viewControllerInstance = self
            }
        }
    }
    

    @IBAction func gradeSliderChanged(_ sender: UISlider) { //Updates the label with the value of progressBar
        let value = sender.value
        
        gradeLabel.text = String(format: "%d", Int(value))
    }
    
    
    @IBAction func onContinueButtonClicked(_ sender: UIButton) { // Displays an error or updates progress bar based on what conditionals are met
        if(nameTextField.text?.isEmpty == true ||
           ageTextField.text?.isEmpty == true ||
           highSchoolTextField.text?.isEmpty == true){
            
            let alert = UIAlertController(title: "Error", message: "Please make sure all fields are filled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            progressBar.progress = 0.5 // Manually set the value of the progress bar if all fields are filled
        }
    }
}

