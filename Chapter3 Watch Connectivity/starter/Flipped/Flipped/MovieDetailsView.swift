//
//  MovieDetailsView.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieDetailsView: View {
    let movie: Movie
    var body: some View {
        VStack {
            HStack {
                Image(movie.poster)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                MovieInfoView(movie: movie)
            }
            Text(movie.synopsis)
                .font(.body)
                .foregroundColor(.gray)
            VStack(alignment: .center) {
                if TicketOffice.shared.isPurchased(movie) {
                    Spacer()
                    QRCodeView(movie: movie)
                        .frame(width: 200, height: 200, alignment: .center)
                    Spacer()
                } else {
                    Spacer()
                    PurchaseTicketView(movie: movie)
                }
            }.padding()
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: Movie.preview())
    }
}
