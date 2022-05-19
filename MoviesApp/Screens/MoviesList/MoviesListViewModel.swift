//
//  MoviesListViewModel.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import Foundation


class MoviesListViewModel{
    
    private let apiService: MoviesServiceProtocol
    
    private var page = 1
    var isPaginating = false
    
    private var moviesModel = [Results](){
            didSet {
                self.updateTableView?()
            }
        }
        
    var getMovies: [Results] {
        return moviesModel
    }
    
    
    
    var updateTableView: (()->())?
    
    
    //DI
    init(apiService: MoviesServiceProtocol = APIServices()){
        self.apiService = apiService
    }
    
        
    func getMoviesData(pagination: Bool = false) {
        if pagination{
            page += 1
            isPaginating = true
        }
        apiService.fetchMovies(urlString: EndPoints.baseURl, page: page) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let movies):
                
                if pagination{
                    self.isPaginating = false
                    self.moviesModel += movies.results!
                }else{
                    self.moviesModel = movies.results!
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}
