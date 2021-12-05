//
//  MovieDetailsView.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    
    var body: some View {
        VStack {
            AsyncImage(url: movie.backgroudURL) { image in
                image.resizable().blur(radius: 2)
            } placeholder: {
                ProgressView()
            }.aspectRatio(16/9, contentMode: .fit)
            
            AsyncImage(url: movie.posterURL) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 167, height: 250)
            .offset(y: -130)
            .padding(.bottom, -130)
            Text(movie.title).font(.title).padding()
            Text(movie.releaseDate)
            Divider()
            Text(movie.overview).padding()
            Spacer()
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie(id: 580489, adult: false, backdropPath: "/lNyLSOKMMeUPr1RsL4KcRuIXwHt.jpg", genreIDS: [878, 28, 12], originalLanguage: "en", originalTitle: "Venom: Let There Be Carnage", overview: "After finding a host body in investigative reporter Eddie Brock, the alien symbiote must face a new enemy, Carnage, the alter ego of serial killer Cletus Kasady.", popularity: 11473.714, posterPath: "/rjkmN1dniUHVYAtwuV3Tji7FsDO.jpg", releaseDate: "2021-09-30", title: "Venom: Let There Be Carnage", video: false, voteAverage: 7.2, voteCount: 3947))
    }
}
