//
//  MovieDetailViewController.swift
//  Assignment 3
//
//  Created by user256704 on 3/18/24.
//

import UIKit

class MovieDetailViewController: UIViewController {

    
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var imdbIdLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    // Creating a variable to hold the passed movie object
    var movie: MovieModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            // Updating UI elements
            titleLabel.text = movie.getTitle()
            yearLabel.text = movie.getYear().description
            imdbIdLabel.text = movie.getImdbID()
            typeLabel.text = movie.getType()
            
            // Loding the poster image from the provided URL
            if let posterUrl = URL(string: movie.getPosterUrl()) {
                //using URLSession to download the image
                URLSession.shared.dataTask(with: posterUrl) {
                    data, response, error in
                    // Look to see if there's an error
                    if let error = error {
                        print("Error downloading poster URL: \(error)")
                        return
                    }
                    
                    // Check if there's data
                    guard let data = data else {
                        print("No data was grabbed")
                        return
                    }
                    
                    // Create UIImage from downloaded data
                    if let posterImage = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.moviePosterImageView.image = posterImage
                        }
                    }
                }.resume()
            }
        }
    }
    

}
