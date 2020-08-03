//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Thomas Cowern New on 7/30/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTests: XCTestCase {

    var sut: MovieLibraryDataService!
    var libraryTableView: UITableView!
    
    let fairytale = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comdedy")
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieLibraryDataService()
        sut.movieManager = MovieManager()
        libraryTableView = UITableView()
        libraryTableView.dataSource = sut
        libraryTableView.delegate = sut
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: Sections
    func testTableViewSections_Count_ReturnsTwo () {
        let sections = libraryTableView.numberOfSections
        XCTAssertEqual(sections, 2)
    }
    
    func testTableViewSections_SectionOne_ReturnsMoviesToSeeCount () {
        sut.movieManager?.addMovie(movie: fairytale)
        sut.movieManager?.addMovie(movie: darkComedy)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 2)
        
        sut.movieManager?.addMovie(movie: thriller)
        libraryTableView.reloadData()
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 0), 3)
    }
    
    func testTableViewSections_SectionTwo_ReturnsMoviesSeenCount () {
        sut.movieManager?.addMovie(movie: fairytale)
        sut.movieManager?.addMovie(movie: darkComedy)
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 1)
        
        sut.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryTableView.reloadData()
        XCTAssertEqual(libraryTableView.numberOfRows(inSection: 1), 2)
    }
    
    // MARK: Cells
    func testCell_RowAtIndex_ReturnsMovieCell () {
        sut.movieManager?.addMovie(movie: darkComedy)
        libraryTableView.reloadData()
        
        let cellQuiried = libraryTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cellQuiried is MovieCell)
    }
    
    func testCell_ShouldDequeueCell () {
        let mock = TableViewMock()
        mock.dataSource = sut
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellId")
        
        sut.movieManager?.addMovie(movie: thriller)
        mock.reloadData()
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(mock.cellDequedProperly)
    }
    
}

extension MovieLibraryDataServiceTests {
    
    class TableViewMock: UITableView {
        var cellDequedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: "identifier", for: indexPath)
        }
    }
}

