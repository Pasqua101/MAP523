//
//  RecipeController.swift
//  Assignment 2
//
//  Created by user256704 on 2/14/24.
//

import UIKit

// Note: adding in UIGestureRecognizerDelegate may be necessary if using two tap gesture recognizers. As I had to program each seque, in order for the second one to work.
class RecipeController: UIViewController, UIGestureRecognizerDelegate  {

    @IBOutlet weak var recipeLabelOne: UILabel!
    @IBOutlet weak var recipeLabelTwo: UILabel!
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    
    var calamari: RecipeModel?
    var bruschetta: RecipeModel?
    var lasagna: RecipeModel?
    var cannoli: RecipeModel?
    
    let foodPictures: [String] = ["Bruschetta.jpg", "Calamari.jpg", "Lasagna.jpg", "Cannolis.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the value of the images and labels
        setFirstRecipe(arrayIndex: 0)
        //Check to make sure the second image and label are not hidden before setting thier value
        if !imageTwo.isHidden && !recipeLabelTwo.isHidden{
            setSecondRecipe(arrayIndex: 1)
        }

        // Adding tap gesture recognizers to image views
        let tapGestureOne = UITapGestureRecognizer(target: self, action: #selector(imageOneTapped))
        imageOne.addGestureRecognizer(tapGestureOne)
        imageOne.isUserInteractionEnabled = true

        let tapGestureTwo = UITapGestureRecognizer(target: self, action: #selector(imageTwoTapped))
        imageTwo.addGestureRecognizer(tapGestureTwo)
        imageTwo.isUserInteractionEnabled = true
    
        
        //Appetizers
        calamari = RecipeModel(name: "Calamari", prepTime: 1200, cookingTime: 300, restTime: 1800,
                                   ingredients: ["1 pound frozen calamari tubes thawed",
                                                "Kosher salt",
                                                "1/2 cup of 2% milk",
                                                "1 1/2 cup of all purpose flour",
                                                "1/3 cup of cornstarch",
                                                "1/2 teaspoon of cornstarch",
                                                "3/4 teaspoon dry oregano",
                                                "1/2 teaspoon black pepper",
                                                "1/2 teaspoon cayenne pepper",
                                                "Grape seed oil as needed",
                                                "1 lemon cut into wedges to serve"], 
                                   steps: ["1. Slice the calamari tubes into ¾-inch thick rings.",
                                          "2. In a medium bowl, stir 1 teaspoon Diamond Crystal kosher salt in 1/2 cup milk.",
                                          "3. Add the calamari rings to the milk mixture and refrigerate (rest) for 30 minutes.",
                                          "4. In a large bowl, whisk together the flour, cornstarch, baking powder, oregano, black pepper, and cayenne (make sure the mixture is well combined).",
                                          "5. Prepare a large colander and set it on top of a large bowl. Using a pair of tongs, take a portion of the calamari rings (about 1/2 of them) shake off excess milk and toss the calamari in the flour mixture. Toss the calamari to coat evenly. Put the coated calamari in the colander. Repeat with the rest of the calamari.",
                                          "6. Turn your oven on a low 150 degrees F. Prepare a large sheet pan and set a wire rack on top. Top the wire rack with paper towel.",
                                          "7. Heat 4 inches of grape seed oil in a small cooking pot (I used a 2.5 quart pot) to somewhere between 350 and 365 degrees F. To test your oil, drop one calamari ring, many bubbles will form around it and the calamari will begin to float.",
                                          "8. Once your oil is ready, using a pair of tongs, gently add some of the calamari in and fry for about 3 minutes or until golden brown. Remove the calamari from the oil and arrange it on the paper towel on top of your prepared wire rack. Immediately season with kosher salt, then transfer to your warm oven to keep warm while you work on the rest. Repeat until you have fried all the calamari.",
                                          "9. Transfer the fried calamari to a serving plate and finish with a squeeze of lemon juice!"])
        
        bruschetta = RecipeModel(name: "Bruschetta", prepTime: 900, cookingTime: 300, restTime: 0,
                                     ingredients: ["1 loaf French bread, cut into 1/4-inch slices",
                                                  "1 tablespoon extra-virgin olive oil",
                                                  "8 roma (plum) tomatoes, diced",
                                                  "1/3 cup chopped fresh basil",
                                                  "1 ounce Parmesan cheese, freshly grated",
                                                  "2 cloves garlic, minced",
                                                  "1 tablespoon good quality balsamic vinegar",
                                                  "2 teaspoons extra-virgin olive oil",
                                                  "1/4 teaspoon kosher salt",
                                                  "1/4 teaspoon freshly ground black pepper"],
                                     steps: ["1. Gather all ingredients.",
                                            "2. Preheat oven to 400 degrees F (200 degrees C).",
                                            "3. Brush bread slices on both sides lightly with 1 tablespoon oil and place on large baking sheet. Toast bread until golden, 5 to 10 minutes, turning halfway through.",
                                            "4. Meanwhile, toss together tomatoes, basil, Parmesan cheese, and garlic in a bowl.",
                                            "5. Mix in balsamic vinegar, 2 teaspoons olive oil, kosher salt, and pepper.",
                                            "6. Spoon tomato mixture onto toasted bread slices.",
                                            "7. Serve immediately and enjoy!"])
        
        
        
        //Main course
        lasagna = RecipeModel(name: "Lasagna", prepTime: 1800, cookingTime: 3600, restTime: 900,
                                  ingredients: ["12 lasagna noodles uncooked",
                                               "4 cups mozzarella cheese shredded and divided",
                                               "1/2 cup parmesan cheese shredded and divided",
                                               "Tomato Sauce",
                                               "1/2 pound lean ground beef",
                                               "1/2 pound Italian sausage",
                                               "1 onion diced",
                                               "2 cloves garlic minced",
                                               "36 ounces of pasta sauce",
                                               "2 tablespoons tomato paste",
                                               "1 teaspoon Italian seasoning",
                                               "Cheese Mixture",
                                               "2 cups ricotta cheese",
                                               "1/4 cup fresh parsley chopped",
                                               "1 cup egg beaten"],
                                  steps: ["1. Preheat the oven to 350°F. In a large pot of salted water, boil lasagna noodles until al dente according to package directions. Drain, rinse under cold water, and set aside.",
                                         "2. In a large skillet or dutch oven, brown beef, sausage, onion, and garlic over medium-high heat until no pink remains. Drain any fat.",
                                         "3. Stir in the pasta sauce, tomato paste, Italian seasoning, 1/2 teaspoon of salt, and 1/4 teaspoon of black pepper. Simmer uncovered over medium heat for 5 minutes or until thickened.",
                                         "4. In a separate bowl, combine 1 1/2 cups mozzarella, 1/4 cup parmesan cheese, ricotta, parsley, egg, and 1/4 teaspoon salt.",
                                         "5. Spread 1 cup of the meat sauce in a 9×13 pan or casserole dish. Top it with 3 lasagna noodles. Layer with 1/3 of the ricotta cheese mixture and 1 cup of meat sauce. Repeat twice more. Finish with 3 noodles topped with remaining sauce.",
                                         "6. Cover with foil and bake for 45 minutes.",
                                         "7. Remove the foil and sprinkle with the remaining 2 1/2 cups mozzarella cheese and 1/4 cup parmesan cheese. Bake for an additional 15 minutes or until browned and bubbly. Broil for 2-3 minutes if desired.",
                                         "8. Rest for at least 15 minutes before cutting."])
        
        
        //Desert (Cannoli recipe doesn't really mention a rest time, just says additional time)
        cannoli = RecipeModel(name: "Cannolis", prepTime: 2700, cookingTime: 3600, restTime: 7200,
                                  ingredients: ["Shells",
                                               "3 cups all-purpose flour",
                                               "1/4 cup white sugar",
                                               "1/4 teaspoon ground cinnamon",
                                               "3 tablespoons shortening",
                                               "1/2 cup sweet Marsala wine",
                                               "2 tablespoons water",
                                               "1 tablespoon distilled white vinegar",
                                               "1 large egg",
                                               "1 egg yolk",
                                               "1 egg white",
                                               "1 quart of oil for frying, or as needed",
                                               "Filling",
                                               "1 (32 ounce) container ricotta cheese, drained",
                                               "1/2 cup confectioners' sugar",
                                               "4 ounces semisweet chocolate, chopped (Optional)",
                                               "1 teaspoon lemon zest, or to taste"],
                                  steps: ["1. Make shells: Mix flour, sugar, and cinnamon together in a medium bowl. Cut in shortening until crumbly.",
                                         "2. Make a well in the center and add Marsala wine, water, vinegar, egg, and egg yolk.",
                                         "3. Mix with a fork until the dough becomes stiff, then finish kneading it by hand on a clean surface, adding a bit more water if needed for about 10 minutes. Cover with plastic wrap and refrigerate for 1 to 2 hours.",
                                         "4. Divide cannoli dough into three balls; flatten each one just enough to get through the pasta machine. Roll a ball of dough through successively thinner settings until you have reached the thinnest setting. Dust lightly with flour if necessary.",
                                         "5. Place the sheet of dough on a lightly floured surface. Using a cutter or large glass, cut out 4 to 5-inch circles.",
                                         "6. Dust the circles with a light coating of flour. This will help you later in removing the shells from the tubes. Roll dough around cannoli tubes, sealing the edge with a bit of egg white. Repeat with remaining dough balls.",
                                         "7. Heat oil in a deep fryer or deep skillet to 375 degrees F (190 degrees C).",
                                         "8. Fry shells on the tubes in hot oil, a few at a time, until golden, about 2 to 3 minutes. Use tongs to turn as needed. Remove shells carefully using tongs, and place them on a cooling rack set over paper towels.",
                                         "9. Cool just long enough that you can handle the tubes, then carefully twist the tube to remove the shell. Using a tea towel may help you get a better grip. Wash or wipe off the tubes, and use them for more shells. Cooled shells can be placed in an airtight container and kept for up to 2 months. You should only fill them immediately or up to 1 hour before serving.",
                                         "10. Make filling: Mix ricotta cheese and confectioners' sugar together in a large bowl until well combined. Fold in chocolate and lemon zest.",
                                         "11. Transfer mixture into a pastry bag and pipe into shells, filling from the center to one end, then doing the same from the other side. Dust with additional confectioners' sugar to serve, if you like."])
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showRecipeOne"{ //For first recipe shown
            if let recipeDetailController = segue.destination as? RecipeDetailController{
                
                // Check to see what kind of recipe is currently being shown, then pass it to next screen
                
                if recipeLabelOne.text == "Bruschetta" {
                    recipeDetailController.recipe = bruschetta
                }
                
                else if recipeLabelOne.text == "Lasagna" {
                    recipeDetailController.recipe = lasagna
                }
                
                else if recipeLabelOne.text == "Cannolis" {
                    recipeDetailController.recipe = cannoli
                }
                
            }
        }
        
        if segue.identifier == "showRecipeTwo"{ // For second recipe shown
            if let recipeDetailController = segue.destination as? RecipeDetailController{
                recipeDetailController.recipe = calamari
                //Using an if statement in case I add more recipes for other courses
//                if recipeLabelTwo.text == "Calamari"{
//                    recipeDetailController.recipe = calamari
//                }
                
            }
        }
    }
    
    @objc func imageOneTapped() {
            performSegue(withIdentifier: "showRecipeOne", sender: self)
        }

        @objc func imageTwoTapped() {
            performSegue(withIdentifier: "showRecipeTwo", sender: self)
        }
    
    @IBAction func onSegmentedControlChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            // Make sure the second recipe is not hidden
            unhideSecondRecipe()
            
            // Set all UI elements to hold their required info
            setFirstRecipe(arrayIndex: 0)
            setSecondRecipe(arrayIndex: 1)
            
        }
        else if sender.selectedSegmentIndex == 1{
            // Hide second recipe
            hideSecondRecipe()
            
            // Set all UI elements to hold their required info
            setFirstRecipe(arrayIndex: 2)
        }
        else if sender.selectedSegmentIndex == 2{
            // Hide second recipe
            hideSecondRecipe()
            
            // Set all UI elements to hold their required info
            setFirstRecipe(arrayIndex: 3)
        }
    }
    
    //Takes in a index for the food array and sets it to the image and label (saves me from typing it more than once)
    func setFirstRecipe(arrayIndex: Int){
        //Set the value of the images and labels
        let recipe: String = foodPictures[arrayIndex]
        imageOne.image = UIImage(named: recipe)
        
        let recipeStr: String = String(recipe.dropLast(4)) //Dropping last 4 characters
        recipeLabelOne.text = recipeStr
    }
    
    // Works the same as the above function but with the second appetizer in mind
    func setSecondRecipe(arrayIndex: Int){
        let recipe: String = foodPictures[arrayIndex]
        imageTwo.image = UIImage(named: recipe)
        
        
        let recipeString: String = String(recipe.dropLast(4))
        recipeLabelTwo.text = recipeString
    }
    
    func hideSecondRecipe(){
        recipeLabelTwo.isHidden = true
        imageTwo.isHidden = true
    }
    
    func unhideSecondRecipe(){
        recipeLabelTwo.isHidden = false
        imageTwo.isHidden = false
    }
}
