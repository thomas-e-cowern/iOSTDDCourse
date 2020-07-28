//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Thomas Cowern New on 7/27/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Initialization
    func testInit_MovieWithTitle() {
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate() {
        let testMovie = Movie(title: "Romantic Comedy", releaseDate: "1987")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1987")
    }
    
    func testEquatable_ReturnsTrue () {
           let actionMovie1 = Movie(title: "Action")
           let actionMovie2 = Movie(title: "Action")
           
           XCTAssertEqual(actionMovie1, actionMovie2)
       }
       
       func testEquatable_ReturnsFalseForDifferentTitles () {
           let actionMovie1 = Movie(title: "Action")
           let actionMovie2 = Movie(title: "Adventure")
           
           XCTAssertNotEqual(actionMovie1, actionMovie2)
       }
       
       func testEquatable_ReturnsFalseForDifferentReleaseDates () {
           let actionMovie1 = Movie(title: "Action", releaseDate: "11/11/11")
           let actionMovie2 = Movie(title: "Action", releaseDate: "12/11/11")
           
           XCTAssertNotEqual(actionMovie1, actionMovie2)
       }

}
