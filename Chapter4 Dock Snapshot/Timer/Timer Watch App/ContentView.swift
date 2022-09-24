//
//  ContentView.swift
//  Timer Watch App
//
//  Created by yangjie.layer on 2022/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var timeText = ""
    @State var snapshotText: String?
    
    private let pushViewForSnapshotPublisher = NotificationCenter
      .default
      .publisher(for: Notification.Name("snapshot"))
    
    var timer: Timer {
        get {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                let formatter = DateFormatter()
                formatter.dateFormat = "hh:mm:ss"
                self.timeText = formatter.string(from: Date())
            }
        }
    }
    
    var body: some View {
        VStack {
            Text(timeText)
                .onAppear {
                    _ = timer
                }
            if snapshotText != nil {
                Text(snapshotText!)
            }
        }
        .onReceive(pushViewForSnapshotPublisher) { notification in
            guard let info = try? SnapshotUserInfo.from(notification: notification) else {
              return
            }
            self.snapshotText = info.content
            info.handler()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
