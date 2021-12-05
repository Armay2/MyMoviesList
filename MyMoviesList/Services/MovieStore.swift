//
//  MovieService.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import Foundation
import Alamofire
import AlamofireImage

protocol MovieService {
    func fetchMovies(page: Int, completion: @escaping (Result<MoviesResponce, Error>) -> ())
}

class MovieStore: MovieService {
    
    // MARK: - Singleton
    static let shared = MovieStore()
    
    private let APIKEY = "APIKEY"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let imageAPIURL = "https://image.tmdb.org/t/p/w500"
    
    private init() {}
    
    /// Get movies list form the Movie API
    /// - Parameters:
    ///   - page: index of movie page to fetch
    ///   - completion: `Result` of request returning `MoviesResponce` on success or `Error` on failure
    func fetchMovies(page: Int, completion: @escaping (Result<MoviesResponce, Error>) -> ()) {
        AF.request(baseAPIURL + "/discover/movie?api_key=" + APIKEY + "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=\(page)&with_watch_monetization_types=flatrate").responseDecodable(of: MoviesResponce.self) { responce in
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

}
