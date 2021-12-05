//
//  MoviesListVM.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import Foundation

class MoviesListVM: ObservableObject {
    
    // MARK: - Properties
    @Published var movies = [Movie]()
  
    init() {
        getMovies()
    }
    
    func getMovies() {
        MovieStore.shared.fetchMovies { result in
            switch result {
            case .success(let moviesResponce):
                self.movies = moviesResponce.movies
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
