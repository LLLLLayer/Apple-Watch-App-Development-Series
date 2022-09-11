//
//  MovieRow.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie
    var body: some View {
        HStack {
            Image(movie.poster)
                .resizable()
                .scaledToFit()
                .frame(width: 70)
            VStack(alignment: .leading) {
                Text(movie.title)
                  .font(.headline)
                  .foregroundColor(.black)
                  .lineLimit(1)
                Text(movie.synopsis)
                  .font(.caption)
                  .foregroundColor(.gray)
                  .lineLimit(3)

            }.padding()
        }
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie.preview())
    }
}
