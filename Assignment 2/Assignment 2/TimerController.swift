//
//  TimerController.swift
//  Assignment 2
//
//  Created by user256704 on 2/15/24.
//

import UIKit

class TimerController: UIViewController {

    
    // UI Elements
    @IBOutlet weak var selectedRecipeLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var selectedStageLabel: UILabel!
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    // Global variables local to the class
    let cookingStages: [String] = ["Prep", "Cooking", "Rest"]
    var timer: Timer?
    var remainingTime: TimeInterval = 60 // 1 minute by default
    var totalTime: TimeInterval = 60 // 1 minute
    
    // Global variables being passed in
    var recipeName: String?
    var prepTime: TimeInterval?
    var cookingTime: TimeInterval?
    var restTime: TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set value of selectedStageLabel to be the first index of the array
        selectedStageLabel.text = cookingStages[0]
        timerProgressBar.progress = 1.0
        
        // Get and set passed in values
        if let recipeName = recipeName{
            //Get total cooking time in minutes
            let totalCookingTime = (Double(prepTime ?? 0.0) + Double(cookingTime ?? 0.0) + Double(restTime ?? 0.0)) / 60
            
            selectedRecipeLabel.text = recipeName + "\nTotal Cooking Time: " + String(format: "%.0f", totalCookingTime) + " minutes"
        }
        //Set remaining and total time to prepTime. Since it is the default option
        if let prepTime = prepTime{
            remainingTime = prepTime
            totalTime = prepTime
            
        }
        
      updateTimerLabel()
    }

    
    @IBAction func onCustomTimeInputted(_ sender: UITextField) {
        let customTimeStr: String = sender.text ?? "0.0" // if we can't get anything then set the default to 0.0
        
        let customTime: TimeInterval = Double(customTimeStr) ?? 0.0
        
        totalTime = customTime * 60
        remainingTime = customTime * 60
        
        updateTimerLabel()
    }
    
    @IBAction func onStageChanged(_ sender: UIStepper) {
        selectedStageLabel.text = cookingStages[Int(sender.value)]
        
        //get the current text of the stage label
        let currentStageText: String? = selectedStageLabel.text
        
        // Get the required time based off of the selected stage and set it to the necessary timer variables
        let selectedTime: TimeInterval = getSelectedStage(currentStageStr: String(currentStageText ?? ""))
    
        totalTime = selectedTime
        remainingTime = selectedTime
        
        updateTimerLabel()
        
    }
    
    
    @IBAction func onResetClicked(_ sender: UIButton) {
        stopTimer()
        
        //get the current text of the stage label
        let currentStageText: String? = selectedStageLabel.text
        
        // Get the required time based off of the selected stage and set it to the necessary timer variables
        let selectedTime: TimeInterval = getSelectedStage(currentStageStr: String(currentStageText ?? ""))
    
        totalTime = selectedTime
        remainingTime = selectedTime
        
        updateTimerLabel()
        updateProgressBar()
    }
    
    
    @IBAction func onStartClicked(_ sender: UIButton) {
        startTimer()
    }
    
    
    @IBAction func onPauseClicked(_ sender: UIButton) {
        stopTimer()
    }
    
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    @objc func updateTimer(){
        remainingTime -= 1
        if remainingTime <= 0 {
            stopTimer()
            showAlert()
        }
        updateTimerLabel()
        updateProgressBar()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Timer Finished", message: "The timer has ended, please move onto the next stage.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func updateTimerLabel(){
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    func updateProgressBar() {
            let progress = Float(remainingTime / totalTime)
            timerProgressBar.progress = progress
    }
    
    // Returns the appropriate time that should be set based on the selected stage in the stepper
    func getSelectedStage(currentStageStr: String) -> TimeInterval{
        
        var resultTime: TimeInterval?
        
        // Reset time based on the selected stage
        if currentStageStr == "Prep" {
            resultTime = prepTime
        }
        else if currentStageStr == "Cooking" {
            resultTime = cookingTime
        }
        else if currentStageStr == "Rest"{
            resultTime = restTime
        }
        
        return TimeInterval(resultTime ?? 0)
    }
}
