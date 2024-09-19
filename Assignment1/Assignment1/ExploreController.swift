//
//  ExploreController.swift
//  Assignment1
//
//  Created by user256704 on 1/31/24.
//

import UIKit

class ExploreController: UIViewController{

    var currentPage = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var picturesImageView: UIImageView!
    
    var collegeFairPictures = ["outside.jpg", "inside.jpg", "college.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changePictures(_ sender: UIPageControl) {
        picturesImageView.image = UIImage(named: collegeFairPictures[sender.currentPage])
    }
    
}
