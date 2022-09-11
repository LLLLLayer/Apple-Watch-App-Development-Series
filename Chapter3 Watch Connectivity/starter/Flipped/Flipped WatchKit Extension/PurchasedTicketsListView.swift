//
//  ContentView.swift
//  Flipped WatchKit Extension
//
//  Created by ByteDance on 2022/9/10.
//

import SwiftUI

struct PurchasedTicketsListView: View {
    @StateObject private var ticketOffice = TicketOffice.shared
    var body: some View {
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
            .padding()
        }
        .navigationBarTitle("Purchased Tickets")
    }
    
    private func delete(at offsets: IndexSet) {
        withAnimation {
            TicketOffice.shared.delete(at: offsets)
        }
    }
}

struct TicketsListView_Previews: PreviewProvider {
    static var previews: some View {
        PurchasedTicketsListView()
    }
}


