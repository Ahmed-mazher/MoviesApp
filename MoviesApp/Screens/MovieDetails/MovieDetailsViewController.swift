//
//  MovieDetailsViewController.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    lazy var viewModel: MovieDetailsViewModel = {
        return MovieDetailsViewModel()
    }()
    
    var movieId = 0
    var movieName = ""
    
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieData: UILabel!
    @IBOutlet weak var movieOverView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movieName
        initVM()
    }
    

    func initVM(){
        // Naive binding
        
        viewModel.updateView = { [weak self] () in
            guard let self = self else {return}
            DispatchQueue.main.async {
                let item = self.viewModel.getMovie
                self.movieTitle.text = item.original_title
                self.movieOverView.text = item.overview
                self.movieData.text = item.release_date
                self.movieImage.getImageKingfisher(imageUrl: EndPoints.imageBaseURL+"w500"+(item.poster_path ?? ""))
            }
        }
        
        viewModel.getMovieData(id: movieId)
    
    }
    
}
