//
//  RegisterPage3Controller.swift
//  Assignment1
//
//  Created by user256704 on 2/1/24.
//

import UIKit

class RegisterPage3Controller: UIViewController {

    //Variables from screen one
    var name: String?
    var age: String?
    var highSchool: String?
    var gradeValue: Float?
    
    //View Controller instance 
    var viewControllerInstance: ViewController?
    
    //Variables from screen two
    var college: String?
    var program: String?
    var semester: String?
    var email: String?
    var tAndCStatus: Bool?
    
    //Variables belonging to UI
    
    @IBOutlet weak var enteredNameLabel: UILabel!
    @IBOutlet weak var eneteredAgeLabel: UILabel!
    @IBOutlet weak var enteredHighSchoolLabel: UILabel!
    @IBOutlet weak var enteredCollegeLabel: UILabel!
    @IBOutlet weak var enteredSemesterLabel: UILabel!
    @IBOutlet weak var tAndCLabel: UILabel!
    @IBOutlet weak var enteredEmailLabel: UILabel! //If empty, display "N/A"
    @IBOutlet weak var enteredAverageLabel: UILabel!
    @IBOutlet weak var enteredProgramLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setting info from screen one
        enteredNameLabel.text = name
        eneteredAgeLabel.text = age
        enteredHighSchoolLabel.text = highSchool
        if let grade = gradeValue {//.description returns a string of the float
            let roundedGrade = Int(floor(grade)) //Since the provided value is a float, we must make sure there are no decimals
            enteredAverageLabel.text = roundedGrade.description
        }
        
        
        //Setting info from screen two
        enteredCollegeLabel.text = college
        enteredProgramLabel.text = program
        enteredSemesterLabel.text = semester
        
        if let tAndCAnswer = tAndCStatus?.description {
            
            if tAndCAnswer == "true"{
                tAndCLabel.text = "Yes"
            }
            else{ //Else isn't really necessary since the user shouldn't be able to move to this screen with agreeing, but just in case
                tAndCLabel.text = "No"
            }
        }
        
        
        if email?.isEmpty == true {
            enteredEmailLabel.text = "N/A"
        }
        else{
            enteredEmailLabel.text = email
        }
    }
    
    
    @IBAction func onSubmitClicked(_ sender: UIButton) { //Displays confirmation alert, and then redirects to first screen after reseting all inputs
        let alert = UIAlertController(title: "Confirmation", message: "Thank you for submitting your application", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            // Dismisss the alert
            self.dismiss(animated: true, completion: nil)
            
            self.viewControllerInstance?.updateUIElements()
            
            // Navigate back to the first screen
            if let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated: true)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    
    }
    
}
