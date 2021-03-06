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
    
    let scifiMovie = Movie(title: "Sci-fi")
    let artHouseMovie = Movie(title: "Art House")
    let actionMovie = Movie(title: "Action/Adventure")

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
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnMovieAtIndex () {
        sut.addMovie(movie: artHouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(artHouseMovie.title, movieQueried.title)
    }
    
    // Mark: Checking off
    func testCheckOffMovie_UpdatesMovieManagerCounts () {
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemoveMovieFromArray () {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, artHouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex () {
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMoviesAtIndex(index: 0)
        
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    func testClearArray_ReturnsArrayCountOfZero () {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.addMovie(movie: artHouseMovie)
        sut.checkOffMovieAtIndex(index: 1)
        
        XCTAssertEqual(sut.moviesToSeeCount, 2)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    // Mark: Duplicates
    func testDuplicateMovies_ShouldNotBeAddedToArray () {
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
}
