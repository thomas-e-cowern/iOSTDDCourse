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
    var moviesSeenCount = 0
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie (movie: Movie) {
        moviesToSeeCount += 1
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex (index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex (index: Int) {
        
        guard index < moviesToSeeCount else { return }
        
        moviesToSeeCount -= 1
        moviesSeenCount += 1
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMoviesAtIndex (index: Int) -> Movie {
        return moviesSeenArray[index]
    }
}
