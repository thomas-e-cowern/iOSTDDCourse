//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Thomas Cowern New on 7/29/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

enum LibrarySection : Int {
    case MoviesToSee, MoviesSeen
}

class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager: MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0 }
        guard let librarySection = LibrarySection(rawValue: section) else { fatalError() }
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath)
        return cell
            
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

}
