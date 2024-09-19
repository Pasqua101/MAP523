//
//  ViewController.swift
//  SlidingVolumeControl
//
//  Created by user256704 on 2/13/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onVolumeSliderChanged(_ sender: UISlider) {
        // Gets value of the slider and converts it to a string
        volumeLabel.text = String(format: "%.0f", sender.value)
        // Note for future cases. Do not use .description in the String() conversion
    }
    
}

