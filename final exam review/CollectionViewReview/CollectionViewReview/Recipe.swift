//
//  Recipe.swift
//  CollectionViewReview
//
//  Created by user256704 on 4/13/24.
//

import Foundation
import UIKit

class Recipe {
    let name: String
    let image: String
    let description: String
    
    init(name: String, image: String, description: String) {
        self.name = name
        self.image = image
        self.description = description
    }
}
