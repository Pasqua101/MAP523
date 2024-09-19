//
//  ViewController.swift
//  Assignment 2
//
//  Created by user256704 on 2/14/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recipesImageView: UIImageView!
    @IBOutlet weak var currentlyDisplayedRecipeLabel: UILabel!
    
    //Array for food images in the assets folder
    var foodPictures = ["Calamari.jpg", "Lasagna.jpg", "Cannolis.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Getting the first index (0) of the foodPicture array
        var recipe: String = foodPictures[0]
        
        //Pass the first index and have to set the cuurent picture
        recipesImageView.image = UIImage(named: foodPictures[0])
        
        // Remove '.jpg' from first index and set it to recipeStr
        let recipeStr: String = String(recipe.dropLast(4)) //Must wrap it in String
        // Using recipeStr to display currently displayed recipe on the label
        currentlyDisplayedRecipeLabel.text = recipeStr
    }

    //Updates imageview based on current value of the page control
    @IBAction func changePictures(_ sender: UIPageControl) {
        // Get the current value of the pageControl
        let currentValue = sender.currentPage
        
        // Use it to display a new image from the array and to update the label
        recipesImageView.image = UIImage(named: foodPictures[currentValue])
        
        var recipe = foodPictures[currentValue]
        let recipeStr = String(recipe.dropLast(4))
        
        currentlyDisplayedRecipeLabel.text = recipeStr
    }
}

