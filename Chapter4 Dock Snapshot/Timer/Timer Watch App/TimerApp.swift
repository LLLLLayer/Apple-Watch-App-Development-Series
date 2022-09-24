//
//  TimerApp.swift
//  Timer Watch App
//
//  Created by yangjie.layer on 2022/9/24.
//

import SwiftUI

final class ExtensionDelegate: NSObject, WKExtensionDelegate {
    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        backgroundTasks.forEach { task in
            guard let snapshot = task as? WKSnapshotRefreshBackgroundTask else {
                task.setTaskCompletedWithSnapshot(false)
                return
            }
            let nextSnapshotDate = nextSnapshotDate()
            let handler = {
                snapshot.setTaskCompleted(
                    restoredDefaultState: false,
                    estimatedSnapshotExpiration: nextSnapshotDate,
                    userInfo: nil
                )
            }
            let snapshotUserInfo = SnapshotUserInfo(
                handler: handler,
                content: "我被快照啦！"
            )
            NotificationCenter.default.post(
                name: Notification.Name("snapshot"),
                object: nil,
                userInfo: snapshotUserInfo.encode()
            )
        }
    }
    
    private func nextSnapshotDate() -> Date {
        let twoDaysLater = Calendar.current.date(
            byAdding: .day,
            value: 2,
            to: Date()
        )!
        return Calendar.current.startOfDay(for: twoDaysLater)
    }
}

@main
struct Timer_Watch_AppApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) private var extensionDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
