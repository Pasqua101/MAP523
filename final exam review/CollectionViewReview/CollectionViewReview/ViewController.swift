//
//  ViewController.swift
//  CollectionViewReview
//
//  Created by user256704 on 4/13/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let recipes = [
        Recipe(name: "Cheese Pizza", image: "tray.full", description: "A delicious pizza topped with cheese."),
        Recipe(name: "Caprese Salad", image: "leaf", description: "A simple salad with ripe tomatoes, mozzarella, basil, and balsamic glaze."),
        Recipe(name: "Pasta Primavera", image: "fork.knife", description: "Pasta tossed with fresh vegetables, garlic, and olive oil."),
        Recipe(name: "Beans Burger", image: "figure.wave", description: "A hearty burger made with black beans, sweet potatoes, and quinoa."),
        Recipe(name: "Vegetable Stir Fry", image: "flame", description: "A mix of sautéed vegetables served over brown rice or noodles."),
        Recipe(name: "Mushroom Risotto", image: "leaf.fill", description: "Creamy risotto cooked with aromatic herbs and mushrooms."),
        Recipe(name: "Butternut Squash Soup", image: "cube.box.fill", description: "A creamy soup made with butternut squash, onions, and carrots, seasoned with nutmeg and cinnamon."),
        Recipe(name: "Chickpea Curry", image: "flame.fill", description: "Chickpeas cooked in a spicy tomato-based sauce, served with rice or naan."),
     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCollectionViewCell
        let recipe = recipes[indexPath.item]
        
        cell.nameLabel.text = recipe.name
        cell.descriptionLabel.text = recipe.description
        cell.imageView.image = UIImage(systemName: recipe.image)
        
        return cell
    }
}

