//
//  MovieListTableViewController.swift
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieItems: [HJHMovieItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movieItems.count
    }

// This function isn't getting called
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell()}
        
        let movie = movieItems[indexPath.row]
        cell.movie = movie

        return cell
    }
}

extension MovieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        HJHMovieItemController.shared().fetchMovie(withSearchTerm: searchTerm) { (movies, error) in
            self.movieItems = movies
        }
    }
}
