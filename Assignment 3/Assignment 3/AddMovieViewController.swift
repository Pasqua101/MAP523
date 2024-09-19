//
//  AddMovieViewController.swift
//  Assignment 3
//
//  Created by user256704 on 3/19/24.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var movieNameTextField: UITextField!
    
    @IBOutlet weak var yearTextField: UITextField!
    
    @IBOutlet weak var imdbIdTextField: UITextField!
    
    @IBOutlet weak var typeOfMovieTextField: UITextField!
    
    @IBOutlet weak var posterUrlTextField: UITextField!
    
    var doneAddingMovie: ((MovieModel) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Function that returns true or false based on if the text in the year text field is numeric or not
    func isNumeric(_ string: String ) -> Bool {
        let numericCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return numericCharacters.isSuperset(of: characterSet)
    }
    
    // alert builder to show errors of any type in this view
    func alertBuilder(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }

    @IBAction func onSubmitButtonClicked(_ sender: UIButton) {
        
        // Grabbing input fields so we can validate it
        let enteredTitle: String  = movieNameTextField.text ?? ""
        let enteredYearStr: String = yearTextField.text ?? ""
        let imdbId: String = imdbIdTextField.text ?? ""
        let movieType: String = typeOfMovieTextField.text ?? ""
        let posterUrl: String = posterUrlTextField.text ?? ""
        
        // Check to see if any fields are empty
        if enteredTitle.isEmpty || enteredYearStr.isEmpty || imdbId.isEmpty || movieType.isEmpty || posterUrl.isEmpty {
            alertBuilder(title: "Error", message: "Please make sure all fields are filled")
            // Exit the function
            return
        }
        
        // If the entered text is not numeric show an alert
        if !isNumeric(enteredYearStr){
            alertBuilder(title: "Error", message: "Please make sure that only numbers are in the year field")
        }
        else{
            let newMovie = MovieModel(title: enteredTitle,
                                      year: Int(enteredYearStr) ?? 0,
                                      imdbID: imdbId,
                                      type: movieType,
                                      posterUrl: posterUrl)
            doneAddingMovie?(newMovie)
            
            navigationController?.popViewController(animated: true)

        }
        
    }

}
