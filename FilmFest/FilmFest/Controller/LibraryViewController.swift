//
//  ViewController.swift
//  FilmFest
//
//  Created by Thomas Cowern New on 7/27/20.
//  Copyright © 2020 Thomas Cowern New. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
    }


}

