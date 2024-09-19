//
//  RegisterPage2Controller.swift
//  Assignment1
//
//  Created by user256704 on 2/1/24.
//

import UIKit

class RegisterPage2Controller: UIViewController {

    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var programTextField: UITextField!
    @IBOutlet weak var semesterTextField: UITextField!
    @IBOutlet weak var tAndCSwitch: UISwitch!
    @IBOutlet weak var emailCopySwitch: UISwitch!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var progressBar: UIProgressView!
    
    //Info from first screen
    var name: String?
    var age: String?
    var highSchool: String?
    var gradeValue: Float?
    var progressBarFromFirstScreen: Float?
    
    var viewControllerInstance: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set the progressBar to have the same value as the one from the previous screen
        if let progressBarValue = progressBarFromFirstScreen {
            progressBar.progress = progressBarValue
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueToRegisterPage3"){
            if let registerPage3Controller = segue.destination as? RegisterPage3Controller {
                
                //Passing data from first screen to third screen
                registerPage3Controller.name = name
                registerPage3Controller.age = age
                registerPage3Controller.highSchool = highSchool
                registerPage3Controller.gradeValue = gradeValue
                
                //Passing data from second screen to third screen
                registerPage3Controller.college = collegeTextField.text
                registerPage3Controller.program = programTextField.text
                registerPage3Controller.semester = semesterTextField.text
                registerPage3Controller.email = emailTextField.text
                registerPage3Controller.tAndCStatus = tAndCSwitch.isOn
                
                //pass the instance of view controller
                registerPage3Controller.viewControllerInstance = viewControllerInstance
            }
        }
    }
    

    
    @IBAction func emailSwitchClicked(_ sender: UISwitch) { //Hides or displays based on if the switch is active or not
        emailLabel.isHidden = !sender.isOn
        emailTextField.isHidden = !sender.isOn
    }
    
    
    @IBAction func onContinueButtonClicked(_ sender: UIButton) { // Displays an error or updates progress bar based on what conditionals are met
        if(collegeTextField.text?.isEmpty == true ||
           programTextField.text?.isEmpty == true ||
           semesterTextField.text?.isEmpty == true){
            let alert = UIAlertController(title: "Error", message: "Please make sure all fields are filled", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else if (tAndCSwitch.isOn == false) {
            let alert = UIAlertController(title: "Error", message: "Please agree to the terms and conditions.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        else if (emailCopySwitch.isOn == true && emailTextField.text?.isEmpty == true){
            let alert = UIAlertController(title: "Error", message: "Please provide an email", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        else{
            progressBar.progress = 1 // Manually set value
        }
    }
}
