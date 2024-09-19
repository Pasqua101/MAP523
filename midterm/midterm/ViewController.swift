//
//  ViewController.swift
//  midterm
//
//  Created by user256704 on 2/21/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        
        //Get text from text field, if nothing state it so the user knows on the next screen
        guard let enteredText = textField.text, !enteredText.isEmpty else{
            let alert = UIAlertController(title: "Error", message: "Please enter text into the textfield before moving on.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
            present(alert, animated: true)
            
            return //Prevent user from moving on and display error
        }
    
        // Try to make an instance of ViewControllerTwo from storyboard, and then try to pass the text to ViewControllerTwo
        if let viewControllerTwo = storyboard?.instantiateViewController(withIdentifier: "ViewControllerTwo") as? ViewControllerTwo {
            // Pass the entered text
                viewControllerTwo.enteredText = enteredText

            // Move to the next screen
                navigationController?.pushViewController(viewControllerTwo, animated: true)
            }

            //Code from a previous question
//        // Creating an alert
//        let alert = UIAlertController(title: "Button Pressed", message: textField.text, preferredStyle: .alert)
//        
//        // Creating an action for the alert
//        let okAction = UIAlertAction(title: "Ok", style: .default)
//        
//        // Adding the action to the alert
//        alert.addAction(okAction)
//        
//        // Show the alert
//        present(alert, animated: true)
    }
    
}

