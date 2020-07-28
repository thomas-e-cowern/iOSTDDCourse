//
//  MovieManager.swift
//  FilmFest
//
//  Created by Thomas Cowern New on 7/28/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount = 0
    let moviesSeenCount = 0
    
    private var moviesToSeeArray = [Movie]()
    
    func addMovie (movie: Movie) {
        moviesToSeeCount += 1
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex (index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
}
