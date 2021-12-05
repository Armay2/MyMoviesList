//
//  MovieService.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import Foundation
import Alamofire

protocol MovieService {
    func fetchMovies(page: Int, completion: @escaping (Result<MoviesResponce, Error>) -> ())
    func fetchMovie(completion: @escaping (Result<Movie, Error>) -> ())
}

class MovieStore: MovieService {
    
    // MARK: - Singleton
    static let shared = MovieStore()
    
    private let APIKEY = "f13e45c35e36cea8df901823086e713d"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private init() {
        
    }
    
    func fetchMovies(page: Int, completion: @escaping (Result<MoviesResponce, Error>) -> ()) {
        debugPrint("fetchMovies")
        AF.request(baseAPIURL + "/discover/movie?api_key=f13e45c35e36cea8df901823086e713d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)&with_watch_monetization_types=flatrate").responseDecodable(of: MoviesResponce.self) { responce in
            debugPrint("responce")
            guard let movies = responce.value else {
                if let error = responce.error {
                    completion(.failure(error))
                }
                return
            }
            completion(.success(movies))
        }
        
    }
    
    func fetchMovie(completion: @escaping (Result<Movie, Error>) -> ()) {
        debugPrint("fetchMovie")
    }

}
