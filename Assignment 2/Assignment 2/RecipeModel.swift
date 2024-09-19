//
//  RecipeModel.swift
//  Assignment 2
//
//  Created by user256704 on 2/14/24.
//

import Foundation


class RecipeModel{
    
    var name: String
    var prepTime: TimeInterval //Note: All time is stored in seconds. Will have to convert them to minutes to display on the page
    var cookingTime: TimeInterval
    var restTime: TimeInterval
    var ingredients: [String]
    var steps: [String]
    
    init(name: String, prepTime: TimeInterval, cookingTime: TimeInterval, restTime: TimeInterval, ingredients: [String], steps: [String]) {
        
        self.name = name
        self.prepTime = prepTime
        self.cookingTime = cookingTime
        self.restTime = restTime
        self.ingredients = ingredients
        self.steps = steps
    }
    
}
