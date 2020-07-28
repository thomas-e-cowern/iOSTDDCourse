//
//  MovieManager.swift
//  FilmFest
//
//  Created by Thomas Cowern New on 7/28/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

class MovieManager {
    var moviesToSeeCount: Int { return moviesToSeeArray.count}
    var moviesSeenCount: Int { return moviesSeenArray.count}
    
    private var moviesToSeeArray = [Movie]()
    private var moviesSeenArray = [Movie]()
    
    func addMovie (movie: Movie) {
        moviesToSeeArray.append(movie)
    }
    
    func movieAtIndex (index: Int) -> Movie {
        return moviesToSeeArray[index]
    }
    
    func checkOffMovieAtIndex (index: Int) {
        
        guard index < moviesToSeeCount else { return }
        
        let checkedMovie = moviesToSeeArray.remove(at: index)
        moviesSeenArray.append(checkedMovie)
    }
    
    func checkedOffMoviesAtIndex (index: Int) -> Movie {
        return moviesSeenArray[index]
    }
}
