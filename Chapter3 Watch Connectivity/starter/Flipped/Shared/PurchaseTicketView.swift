//
//  PurchaseTicketView.swift
//  Flipped
//
//  Created by yangjie.layer on 2022/9/10.
//

import SwiftUI

struct PurchaseTicketView: View {
    @State private var isPresented = false
    let movie: Movie
    var body: some View {
        if TicketOffice.shared.isPurchased(movie) {
            EmptyView()
        } else {
            Button(
                action: {
                    isPresented = true
                }, label: {
                    Text("Purchase")
                        .font(.title3)
                })
            .tint(.white)
            .padding()
            .background(.blue)
            .cornerRadius(20)
            .actionSheet(isPresented: $isPresented) {
                ActionSheet(
                    title: Text("Purchase Ticket"),
                    message: Text("Are you sure you want to purchase this ticket?"),
                    buttons: [
                        .cancel(),
                        .default(Text("Buy")) {
                            TicketOffice.shared.purchase(movie)
                        }]
                )
            }
        }
    }
}

struct PurchaseTicketView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseTicketView(movie: Movie.preview())
    }
}
