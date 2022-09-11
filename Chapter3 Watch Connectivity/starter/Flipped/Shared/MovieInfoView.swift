//
//  MovieInfoView.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieInfoView: View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(movie.title)
                .font(.headline)
            Text("Time: \(movie.time)")
            Text("Director:")
            Text(movie.director)
            Text("Actors:")
            Text(movie.actors)
        }
        .font(.subheadline)
        .foregroundColor(.gray)
    }
}

struct MovieInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MovieInfoView(movie: Movie.preview())
    }
}
