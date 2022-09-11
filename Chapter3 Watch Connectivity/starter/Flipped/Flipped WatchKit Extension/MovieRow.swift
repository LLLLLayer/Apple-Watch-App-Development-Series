//
//  MovieRow.swift
//  Flipped WatchKit Extension
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    var body: some View {
        Text(movie.title)
          .font(.subheadline)
          .foregroundColor(.white)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie.preview())
    }
}
