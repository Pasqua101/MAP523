//
//  ViewController.swift
//  StopwatchApp
//
//  Created by user256704 on 2/13/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    //Making a global timer variable
    var timer: Timer?
    var runCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onResetButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func onStartButtonClicked(_ sender: UIButton) {
    }
    
    
    @IBAction func onStopButtonClicked(_ sender: UIButton) {
    }
}
