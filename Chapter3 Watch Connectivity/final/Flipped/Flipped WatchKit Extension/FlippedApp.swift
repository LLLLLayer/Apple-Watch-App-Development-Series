//
//  FlippedApp.swift
//  Flipped WatchKit Extension
//
//  Created by ByteDance on 2022/9/10.
//

import SwiftUI

@main
struct FlippedApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                PurchasedTicketsListView()
            }
        }
    }
}
