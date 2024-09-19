//
//  ViewController.swift
//  stopWatchPractice
//
//  Created by user256704 on 2/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var stopWatchLabel: UILabel!
    
    var timer: Timer?
    var startTime: Date?
    var elapsedTime: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    @IBAction func onStopButtonClicked(_ sender: UIButton) {
        stopTimer()
    }
    
    
    @IBAction func onResetButtonClicked(_ sender: UIButton) {
        stopTimer()
        elapsedTime = 0
        updateStopwatchLabel()
    }
    
    
    @IBAction func onStartButtonClicked(_ sender: UIButton) {
        if timer == nil{
            startTime = Date()
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
        }
    }
    
    @objc func updateElapsedTime() {
            guard let startTime = startTime else { return }
            let currentTime = Date()
            elapsedTime = currentTime.timeIntervalSince(startTime)
            updateStopwatchLabel()
        }
        
    func updateStopwatchLabel() {
            let minutes = Int(elapsedTime / 60)
            let seconds = Int(elapsedTime) % 60
            let milliseconds = Int((elapsedTime * 100).truncatingRemainder(dividingBy: 100))
            stopWatchLabel.text = String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
        }
        
    func stopTimer() {
            timer?.invalidate()
            timer = nil
        }
    
}

