//
//  ApiServices.swift
//  MoviesApp
//
//  Created by Front Tech on 19/05/2022.
//

import Foundation

protocol MoviesServiceProtocol {
    func fetchMovies(urlString: String, page: Int, completion: @escaping (Result<MoviesListModel, Error>) ->())
}

protocol MovieDetailsServiceProtocol {
    func fetchMovieDetails(urlString: String, movieId: Int, completion: @escaping (Result<MovieDetailModel, Error>) ->())
}

enum AppError: Error{
    case noData
}

class APIServices: MoviesServiceProtocol {
    func fetchMovies(urlString: String, page: Int, completion: @escaping (Result<MoviesListModel, Error>) -> ())  {
        let fullUrl = urlString+"?api_key=\(EndPoints.api_key)"+"&page=\(page)"
        guard let url = URL(string: fullUrl) else { return print("Error in URL Of API")}
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,error == nil else {
                // check for fundamental networking error
                completion(.failure(AppError.noData))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(MoviesListModel.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(AppError.noData))
            }
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                completion(.failure(AppError.noData))
                print("statusCode should be 2xx, but is \(response.statusCode)")
                
                return
            }
        }
        .resume()
    }
    
}

extension APIServices: MovieDetailsServiceProtocol {
    
    func fetchMovieDetails(urlString: String, movieId: Int, completion: @escaping (Result<MovieDetailModel, Error>) -> ()) {
        let fullUrl = urlString+"\(movieId)"+"?api_key=\(EndPoints.api_key)"
        guard let url = URL(string: fullUrl) else { return print("Error in URL Of API")}
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data,
                  let response = response as? HTTPURLResponse,error == nil else {
                // check for fundamental networking error
                completion(.failure(AppError.noData))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(MovieDetailModel.self, from: data)
                completion(.success(jsonData))
            } catch {
                completion(.failure(AppError.noData))
            }
            guard (200 ... 299) ~= response.statusCode else {
                // check for http errors
                completion(.failure(AppError.noData))
                print("statusCode should be 2xx, but is \(response.statusCode)")
                
                return
            }
        }
        .resume()
    }
    
}
