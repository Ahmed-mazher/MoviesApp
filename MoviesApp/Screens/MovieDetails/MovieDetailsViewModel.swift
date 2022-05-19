//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import Foundation

class MovieDetailsViewModel{
    
    private let apiService: MovieDetailsServiceProtocol
    
    private var movieModel = MovieDetailModel(){
            didSet {
                self.updateView?()
            }
        }
        
    var getMovie: MovieDetailModel {
        return movieModel
    }
    
    var updateView: (()->())?
    
    //DI
    init(apiService: MovieDetailsServiceProtocol = APIServices()){
        self.apiService = apiService
    }
    
    func getMovieData(id: Int) {
        apiService.fetchMovieDetails(urlString: EndPoints.baseUrl2, movieId: id) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let movie):
                    self.movieModel = movie
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
