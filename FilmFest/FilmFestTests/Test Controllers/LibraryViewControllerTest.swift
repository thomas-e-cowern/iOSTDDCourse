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
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID")
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Nil checks
    func testLibraryVC_TableViewShouldNotBeNil () {
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    // MARK: Data source
    func testDataSource_ViewDidLoad_SetsTableViewDataSource () {
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    // MARK: Delegate
    func testDelegate_ViewDidLoad_SetsTableViewDelegate () {
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }

}
