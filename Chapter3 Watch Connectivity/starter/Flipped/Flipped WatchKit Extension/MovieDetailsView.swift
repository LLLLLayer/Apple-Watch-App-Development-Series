//
//  MovieDetailsView.swift
//  Flipped WatchKit Extension
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    var body: some View {
        ScrollView {
            MovieInfoView(movie: movie)
            if !TicketOffice.shared.isPurchased(movie) {
                PurchaseTicketView(movie: movie)
            }
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie.preview())
    }
}
