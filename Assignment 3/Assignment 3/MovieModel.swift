//
//  MovieModel.swift
//  Assignment 3
//
//  Created by user256704 on 3/14/24.
//

import Foundation

class MovieModel {
    
    private var title: String
    private var year: Int
    private var imdbID: String
    private var type: String
    private var posterUrl: String
    
    init(title: String, year: Int, imdbID: String, type: String, posterUrl: String) {
        self.title = title
        self.year = year
        self.imdbID = imdbID
        self.type = type
        self.posterUrl = posterUrl
    }
    
    public func getTitle() -> String {
        return self.title
    }
    
    public func getYear() -> Int {
        return self.year
    }
    
    public func getImdbID() -> String {
        return self.imdbID
    }
    
    public func getType() -> String {
        return self.type
    }
    
    public func getPosterUrl() -> String {
        return self.posterUrl
    }
}
