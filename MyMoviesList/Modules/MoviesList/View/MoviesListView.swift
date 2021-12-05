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
                Text(movie.title).onAppear {
                    moviesListVM.loadMoviesIfNeeded(currentItem: movie)
                  }
            }.navigationBarTitle("SwiftUI Alamofire")
        }
    }
    

}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
