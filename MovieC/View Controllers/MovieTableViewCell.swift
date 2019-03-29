//
//  MovieTableViewCell.swift
//  MovieC
//
//  Created by Hannah Hoff on 3/29/19.
//  Copyright © 2019 Hannah Hoff. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movie: HJHMovieItem? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let unwrappedMovie = movie else { return }
        
        titleLabel.text = unwrappedMovie.title
        descriptionLabel.text = unwrappedMovie.overview
    }
}
