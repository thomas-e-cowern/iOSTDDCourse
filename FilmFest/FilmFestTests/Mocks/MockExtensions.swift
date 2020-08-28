//
//  MockExtensions.swift
//  FilmFestTests
//
//  Created by Thomas Cowern New on 8/28/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import Foundation
import UIKit

@testable import FilmFest

extension MovieLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequedProperly = false
        
        class func initMock(dataSource: MovieLibraryDataService) -> TableViewMock {
            let mock = TableViewMock(frame: CGRect.init(x: 0, y: 0, width: 300, height: 500), style: .plain)
            mock.dataSource = dataSource
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
            
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath)
        }
    }
}

class MovieCellMock: MovieCell {
    var movieData: Movie?
    
    override func configMovieCell (movie: Movie) {
        movieData = movie
    }
}
