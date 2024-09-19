//
//  WelcomeController.swift
//  Assignment1
//
//  Created by user256704 on 1/31/24.
//

import UIKit

class WelcomeController: UIViewController {

    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var collegeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func segmentedControlChange(_ sender: Any) { //Updates the image being displayed based on what index is selected
        if(segmentedController.selectedSegmentIndex == 0){
            let senecaImage = UIImage(named: "5eb9a067b0347957f67c9686_WebRes_IMG_05910-173.jpg")
            collegeImageView.image = senecaImage
        }
        else if(segmentedController.selectedSegmentIndex == 1){
            let humberImage = UIImage(named: "Humber_College-1.jpg")
            
            collegeImageView.image = humberImage
        }
    }
}
