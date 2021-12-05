//
//  Movie.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import Foundation

// MARK: - Movies
struct MoviesResponce: Codable {
    let page: Int
    let movies: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


/* https://api.themoviedb.org/3/discover/movie?api_key=f13e45c35e36cea8df901823086e713d&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
 */
