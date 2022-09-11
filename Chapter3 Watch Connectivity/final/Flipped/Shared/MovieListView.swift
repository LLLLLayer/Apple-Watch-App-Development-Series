//
//  MovieListView.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var ticketOffice = TicketOffice.shared
    @State private var selection: Int?
    private let purchasableMovies = TicketOffice.shared.purchasableMovies()
    var body: some View {
        List {
            ForEach(purchasableMovies.keys.sorted(), id: \.self) { title in
                Section {
                    ForEach(purchasableMovies[title]!.sorted(by: { $0.title < $1.title })) { movie in
                        NavigationLink(destination: MovieDetailsView(movie: movie)) {
                            MovieRow(movie: movie)
                        }
                    }
                } header: {
                    Text(title)
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
