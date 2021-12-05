//
//  MoviesListView.swift
//  MyMoviesList
//
//  Created by Arnaud on 05/12/2021.
//

import SwiftUI

struct MoviesListView: View {
    @StateObject var moviesListVM = MoviesListVM()
    
    var body: some View {
        NavigationView{
            List(moviesListVM.movies) { movie in
                NavigationLink {
                    MovieDetailsView(movie: movie)
                } label: {
                    HStack {
                        Spacer()
                        MovieRow(movie: movie)
                        Spacer()
                    }
                    .onAppear {
                        moviesListVM.loadMoviesIfNeeded(currentItem: movie)
                    }
                }
            }.navigationBarTitle("Movies")
            if moviesListVM.isLoadingPage {
                ProgressView()
            }
        }
    }
    

}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
