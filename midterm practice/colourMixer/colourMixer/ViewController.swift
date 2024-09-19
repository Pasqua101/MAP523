//
//  ViewController.swift
//  colourMixer
//
//  Created by user256704 on 2/20/24.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateColour()
    }
    
    
    @IBAction func onSliderChanged(_ sender: UISlider) {
        updateColour()
    }
    
    func updateColour(){
        let red = CGFloat(redSlider.value)
        let blue = CGFloat(blueSlider.value)
        let green = CGFloat(greenSlider.value)
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
}

