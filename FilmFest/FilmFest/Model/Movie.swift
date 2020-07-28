//
//  Movie.swift
//  FilmFest
//
//  Created by Thomas Cowern New on 7/27/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Movie {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
    }
}
