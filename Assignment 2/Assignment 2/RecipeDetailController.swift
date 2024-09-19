//
//  RecipeDetailController.swift
//  Assignment 2
//
//  Created by user256704 on 2/15/24.
//

import UIKit

class RecipeDetailController: UIViewController {

    //UI elements
    
    @IBOutlet weak var recipeNameLabel: UILabel!
    
    @IBOutlet weak var ingredientsListLabel: UILabel!
    
    @IBOutlet weak var stepsListLabel: UILabel!
    
    //Recipe Model variable
    var recipe: RecipeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the passed information
        if let recipe = recipe{
            // Set the required infromation to each UI element
            
            recipeNameLabel.text = recipe.name
            
            //Join arrays together and separare by a newline
            let ingredientsList = recipe.ingredients.joined(separator: "\n")
            
            let stepsList = recipe.steps.joined(separator: "\n")
            
            ingredientsListLabel.text = ingredientsList
            stepsListLabel.text = stepsList
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimer"{
            if let timerController = segue.destination as? TimerController {
                
                //Pass name and cooking times
                timerController.recipeName = recipe?.name
                timerController.prepTime = recipe?.prepTime
                timerController.cookingTime = recipe?.cookingTime
                timerController.restTime = recipe?.restTime
                
            }
        }
    }
    
}
