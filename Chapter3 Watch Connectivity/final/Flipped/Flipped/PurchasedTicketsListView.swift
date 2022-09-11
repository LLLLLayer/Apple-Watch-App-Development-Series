//
//  ContentView.swift
//  Flipped
//
//  Created by ByteDance on 2022/9/10.
//

import SwiftUI

struct PurchasedTicketsListView: View {
    @StateObject private var ticketOffice = TicketOffice.shared
    var body: some View {
        NavigationView {
            List {
                ForEach(ticketOffice.purchased) { movie in
                    NavigationLink(destination: MovieDetailsView(movie: movie)) {
                        MovieRow(movie: movie)
                    }
                }
                .onDelete(perform: delete)
                NavigationLink(destination: MovieListView()) {
                    Text("Purchase tickets")
                        .font(.title3)
                        .fontWeight(.black)
                        .padding()
                }
                .isDetailLink(false)
                .padding()
            }
            .navigationBarTitle("Purchased Tickets")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    private func delete(at offsets: IndexSet) {
        withAnimation {
            TicketOffice.shared.delete(at: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasedTicketsListView()
    }
}
