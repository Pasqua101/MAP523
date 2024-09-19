//
//  ViewController.swift
//  slidingVolumeControlApp
//
//  Created by user256704 on 2/19/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var volumeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onSliderChanged(_ sender: UISlider) {
        
        var volumeLevel: Int = Int(sender.value) // converting value to an int so we don't have to round it
        
        volumeLabel.text = volumeLevel.description
    }
    
}

