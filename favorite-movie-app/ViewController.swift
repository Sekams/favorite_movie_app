//
//  ViewController.swift
//  favorite-movie-app
//
//  Created by Simon Peter Ssekamatte on 1/17/18.
//  Copyright © 2018 sp_ssekamatte. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var favoriteMovies: [Movie] = []
    
    @IBOutlet var mainTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "searchMoviesSegue" {
            let controller = segue.destination as! SearchViewController
            controller.delegate = self
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviecell = tableView.dequeueReusableCell(withIdentifier: "customcell",
                                                      for: indexPath) as! CustomTableViewCell
        let idx: Int = indexPath.row
        
        moviecell.movieTitle?.text = favoriteMovies[idx].title
        moviecell.movieYear?.text = favoriteMovies[idx].year
        
        displayMovieImage(idx, moviecell: moviecell)
        return moviecell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105 
    }
    
    func displayMovieImage(_ row: Int, moviecell: CustomTableViewCell) {
        let url: String = (URL(string: favoriteMovies [row].imageUrl)?.absoluteString)!
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data,
            response, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                moviecell.movieImageView?.image = image
            })
        }).resume()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTableView.reloadData()
        if favoriteMovies.count == 0 {
            favoriteMovies.append(Movie(id: "m000001", title: "Coco", year: "2017", imageUrl: "https://i.pinimg.com/originals/48/6d/84/486d84da85de346d0a007af688f4ed31.jpg"))
        }
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

