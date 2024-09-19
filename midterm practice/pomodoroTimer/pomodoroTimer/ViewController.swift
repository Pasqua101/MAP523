//
//  ViewController.swift
//  pomodoroTimer
//
//  Created by user256704 on 2/20/24.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    
    
    @IBOutlet weak var timerLabel: UILabel!
    var timer: Timer?
    var remainingTime: TimeInterval = 60
    var totalTime: TimeInterval = 60
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onTextFieldChanged(_ sender: UITextField) {
        let customTimeStr: String = sender.text ?? "0.0"
        let customTime: TimeInterval = Double(customTimeStr) ?? 0.0
        
        totalTime = customTime * 60
        remainingTime = customTime * 60
        
        updateTimerLabel()
    }
    
    
    @IBAction func onStartButtonClicked(_ sender: UIButton) {
        startTimer()
    }
    
    
    @IBAction func onResetButtonClicked(_ sender: UIButton) {
        stopTimer()
    }
    
    
    @IBAction func onPauseButtonClicked(_ sender: UIButton) {
        stopTimer()
    }
    
    func startTimer(){
        if timer == nil{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func updateTimerLabel(){
        let minutes = Int(remainingTime) / 60
        let seconds = Int(remainingTime) % 60
        
        timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    @objc func updateTimer(){
        remainingTime = remainingTime - 1
        
        if remainingTime <= 0 {
            stopTimer()
            AudioServicesPlayAlertSound(1005)
        }
        updateTimerLabel()
    }
}

