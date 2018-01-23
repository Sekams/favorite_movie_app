//
//  Movie.swift
//  favorite-movie-app
//
//  Created by Simon Peter Ssekamatte on 1/18/18.
//  Copyright © 2018 sp_ssekamatte. All rights reserved.
//

import Foundation

class Movie {
    var id: String = ""
    var title: String = ""
    var year: String = ""
    var imageUrl: String = ""
    var plot: String = ""
    
    init(id: String, title: String, year: String, imageUrl: String, plot: String = "")
    {
        self.id = id
        self.title = title
        self.year = year
        self.imageUrl = imageUrl
        self.plot = plot
    }
}
