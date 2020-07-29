//
//  LibraryViewControllerTest.swift
//  FilmFestTests
//
//  Created by Thomas Cowern New on 7/29/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import XCTest

@testable import FilmFest
class LibraryViewControllerTest: XCTestCase {
    
     var sut: LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LibraryViewController()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Nil checks
    
    func testLibraryVC_TableViewShouldNotBeNil () {
        
    }
    

}
