//
//  MoviesListVM.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import Foundation

/// Movies List View Model is managing Movies list view datas
class MoviesListVM: ObservableObject {
    
    // MARK: - Properties
    @Published var movies = [Movie]()
    @Published var isLoadingPage = false
    private var currentPage = 1
    private var canLoadMorePages = true
    
    // MARK: - Init & Deinit
    init() {
        getMovies()
    }
    
    // MARK: - Methodes
    
    /// Check if it's needed to add more movies to the list
    /// - Parameter movie: last movie displayed
    func loadMoviesIfNeeded(currentItem movie: Movie?) {
      guard let movie = movie else {
          getMovies()
        return
      }
      let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
      if movies.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
        getMovies()
      }
    }
    
    
    /// Add movies to list using pages
    func getMovies() {
        guard !isLoadingPage && canLoadMorePages else {
            return
        }
        isLoadingPage = true
        MovieStore.shared.fetchMovies(page: currentPage) { result in
            switch result {
            case .success(let moviesResponce):
                if self.currentPage > moviesResponce.totalPages {
                    self.canLoadMorePages = false
                }
                self.isLoadingPage = false
                self.currentPage += 1
                self.movies.append(contentsOf: moviesResponce.movies)
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
    
}
