//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Thomas Cowern New on 7/28/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Mark: Initial Values
    func testInit_MoviesToSee_ReturnsZero () {
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero () {
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    // Mark: Add & Query
    func testAdd_MoviesToSee_ReturnsOne () {
        let testMovie = Movie(title: "Sci-Fi")
        sut.addMovie(movie: testMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex () {
        let testMovie = Movie(title: "Art House Drama")
        sut.addMovie(movie: testMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(testMovie.title, movieQueried.title)
    }

}
