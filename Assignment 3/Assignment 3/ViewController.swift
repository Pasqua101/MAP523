//
//  ViewController.swift
//  Assignment 3
//
//  Created by user256704 on 3/14/24.
//

import UIKit

class ViewController: UIViewController{

    
    @IBOutlet weak var moviesTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Holds the selected movie from the table view so we can transfer it to the MovieDetailViewController
    var selectedMovie: MovieModel?
    
    // Stores the filtered movies from the search bar
    var filteredMovies: [MovieModel] = []
    
    var moviesList: [MovieModel] = [
        MovieModel(title: "Grave of the Fireflies", year: 1988, imdbID: "tt0095327", type: "War/Animation", posterUrl: "https://image.tmdb.org/t/p/original/wcNkHDbyc290hcWk7KXbBZUuXpq.jpg"),
        MovieModel(title: "Gran Turismo", year: 2023, imdbID: "tt4495098", type: "Action/Sport", posterUrl: "https://juksun.com/wp-content/uploads/2023/02/Gran-Turismo-Movie-Poster-1.jpg"),
        MovieModel(title: "Five Nights At Freddy's", year: 2023, imdbID: "tt4589218", type: "Horror/Adaptation", posterUrl: "https://m.media-amazon.com/images/M/MV5BMDM5NmQyNGYtZmRiMS00NDQwLTkzZGMtYWQyZjBkMmI3MGI2XkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg"),
        MovieModel(title: "Oppenheimer", year: 2023, imdbID: "tt15398776", type: "Thriller", posterUrl: "https://assets-prd.ignimgs.com/2022/07/21/oppenheimer-poster-1658411601593.jpeg"),
        MovieModel(title: "Spider-Man: Across the Spider-Verse", year: 2023, imdbID: "tt9362722", type: "Animation/Action", posterUrl: "https://www.brickfanatics.com/wp-content/uploads/2022/12/Spider-Man-Across-the-Spider-Verse-poster-712x1024.jpg"),
        MovieModel(title: "Spider-Man", year: 2002, imdbID: "tt0145487", type: "Action/Adventure", posterUrl: "https://th.bing.com/th/id/OIP.8YVxHY_sNaqKXFK-uIOkmgHaLB?pid=ImgDet&rs=1"),
        MovieModel(title: "Spider-Man 2", year: 2004, imdbID: "tt0316654", type: "Action/Adventure", posterUrl: "https://www.themoviedb.org/t/p/original/olxpyq9kJAZ2NU1siLshhhXEPR7.jpg"),
        MovieModel(title: "Spider-Man 3", year: 2007, imdbID: "tt0413300", type: "Action/Adventure", posterUrl: "https://th.bing.com/th/id/R.46e97616057921b003312ca8e2bda6bd?rik=t9opCyQOg4A2eQ&pid=ImgRaw&r=0"),
        MovieModel(title: "All Quiet on the Western Front", year: 2022, imdbID: "tt1016150", type: "Action/Drama", posterUrl: "https://www.naijaprey.com/wp-content/uploads/2022/10/All-Quiet-On-The-Western-Front.jpeg"),
        MovieModel(title: "Asteroid City", year: 2023, imdbID: "tt14230388", type: "Comedy/Drama", posterUrl: "https://www.syfy.com/sites/syfy/files/styles/scale_640_no_scale/public/2023/05/asteroid_poster_ig.jpg"),
        MovieModel(title: "Kizumonogatari Part 1: Tekketsu", year: 2016, imdbID: "tt3138698", type: "Action/Animation/Comedy", posterUrl: "https://m.media-amazon.com/images/M/MV5BZmJkN2Q4ZmQtOWY0ZC00MjNmLWFiN2ItY2NiNjYxMGQxZWRhXkEyXkFqcGdeQXVyMjE5MjQ4Nzk@._V1_.jpg"),
        MovieModel(title: "Kizumonogatari Part 2: Nekketsu", year: 2016, imdbID: "tt5084196", type: "Animation/Action/Drama", posterUrl: "https://m.media-amazon.com/images/M/MV5BMmRiZTgxOWItNzBlNy00YjFhLWFmNGMtYTRkMTc5MThlOTkxXkEyXkFqcGdeQXVyMjM5ODMxODc@._V1_.jpg"),
        MovieModel(title: "Kizumonogatari Part 3: Reiketsu", year: 2017, imdbID: "tt5084198", type: "Animation/Action/Drama", posterUrl: "https://m.media-amazon.com/images/M/MV5BMzNhZDNiMWItYmQzZC00YjBkLTk1MDMtYTExYTU3ODg3NzA0XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"),
        MovieModel(title: "Cowboy Bebop: The Movie", year: 2001, imdbID: "tt0275277", type: "Animation/Action/Drama", posterUrl: "https://m.media-amazon.com/images/M/MV5BNTE5YTAyZDctNjFhYi00YmJhLTg4ZGUtNDk1OTE0ZTY4NTYwL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg"),
        MovieModel(title: "Harry Potter and the Sorcerer's Stone", year: 2001, imdbID: "tt0241527", type: "Adventure/Family/Fantasy", posterUrl: "https://m.media-amazon.com/images/M/MV5BNmQ0ODBhMjUtNDRhOC00MGQzLTk5MTAtZDliODg5NmU5MjZhXkEyXkFqcGdeQXVyNDUyOTg3Njg@._V1_.jpg"),
        MovieModel(title: "The Boy and the Heron", year: 2023, imdbID: "tt6587046", type: "Animation/Adventure/Drama", posterUrl: "https://m.media-amazon.com/images/M/MV5BZjE1MzJlNjYtNDI3ZS00MzRkLTlhMDYtNDU5YWU3YTI3Yzg0XkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_.jpg")
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show all movies on inital setup by passing the list to the filtered list
        filteredMovies = moviesList
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMovieDetails" {
            if let movieDetailController = segue.destination as? MovieDetailViewController {
                //Pass selected movie
                movieDetailController.movie = selectedMovie
            }
        }
        else if segue.identifier == "showAddMovie" {
            if let addMovieVc = segue.destination as? AddMovieViewController {
                addMovieVc.doneAddingMovie = { [weak self] newMovie in
                    guard let self = self else {return}
                    
                    self.moviesList.append(newMovie)
                    self.filteredMovies = self.moviesList
                    
                    // Refresh the table to show the change
                    self.moviesTableView.reloadData()
                    
                    //Scroll down to the last row to show the newly added movie
                    let lastRowIndex = IndexPath(row: self.filteredMovies.count - 1, section: 0)
                    self.moviesTableView.scrollToRow(at: lastRowIndex, at: .bottom, animated: true)
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    // TableView methods (functions)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Creating an object to use the TableViewCell we created with the identifier of MovieInfoCell
        let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieInfoCell", for: indexPath) as! MovieTableViewCell
        
        // Setting the data in each row
        movieCell.movieNameLabel.text = filteredMovies[indexPath.row].getTitle()
        movieCell.yearOfReleaseLabel.text = filteredMovies[indexPath.row].getYear().description // Convert the value to a string with .description
        movieCell.typeLabel.text = filteredMovies[indexPath.row].getType()
        
        return movieCell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Delete Action
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] (action, view, completion) in
            guard let self = self else { return }
            
            // Grab the selected index
            let selectedIndex = indexPath.row
        
            // Create an alert to show the user for confirmation
            let alert = UIAlertController(title: "Delete Movie", message: "Are you sure you want to delete \(filteredMovies[selectedIndex].getTitle())?", preferredStyle: .alert)
            
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelButton)
            
            let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { _ in
                
                // To make sure that both lists are in sync whether the item is deleted in a search or not we have to get the imdbId
                let imdbId = self.filteredMovies[selectedIndex].getImdbID()
                
                
                // remove item from the filtered list
                self.filteredMovies.remove(at: selectedIndex)
                
                // Find the item with the same imdbId in the moviesList
                if let index = self.moviesList.firstIndex(where: {$0.getImdbID() == imdbId}) {
                    self.moviesList.remove(at: index)
                }
                
                //Remove the row from the table
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                // Reload the table to show the results. Since if we filter the list and then delete, the result still shows
                self.moviesTableView.reloadData()
            }
            alert.addAction(deleteButton)
            self.present(alert, animated: true)
            completion(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
            
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // willSelectRow is called when the user taps on the row. Makes it perfect for grabbing the selected movie and passing it off for the segue
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedMovie = filteredMovies[indexPath.row]
        return indexPath
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // Filtering movies based on the search text
        filteredMovies = searchText.isEmpty ? moviesList : moviesList.filter { $0.getTitle().lowercased().contains(searchText.lowercased()) }
        
        // Refresh table to show results
        moviesTableView.reloadData()
    }
    
    
}
