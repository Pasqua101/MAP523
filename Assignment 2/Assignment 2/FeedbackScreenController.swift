//
//  FeedbackScreenController.swift
//  Assignment 2
//
//  Created by user256704 on 2/14/24.
//

import UIKit

class FeedbackScreenController: UIViewController {

    
    
    @IBOutlet weak var ratingScoreLabel: UILabel!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var shareSwitch: UISwitch!
    
    @IBOutlet weak var ratingSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //Used to reset fields to default when form is submitted
    func resetFields(){
        ratingSlider.value = 1
        ratingScoreLabel.text = "(1/10)"
        reviewTextField.text = ""
        shareSwitch.isOn = false
    }
    
    @IBAction func onRatingSliderChanged(_ sender: UISlider) {
        //Getting the value of the slider, removing decimals and setting it to the label
        ratingScoreLabel.text = "(" + String(format: "%.0f", sender.value) + "/10)"
    }
    
    @IBAction func onSubmitButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Success", message: "Thank you for your review", preferredStyle: .alert)
        
        //Adding an action button that when clicked it resets the fields
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            //Dismissing the alert
            self.dismiss(animated: true, completion: nil)
            
            self.resetFields()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
