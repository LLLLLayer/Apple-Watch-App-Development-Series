//
//  ExtensionDelegate.swift
//  Pawsome Watch App
//
//  Created by yangjie.layer on 2022/10/16.
//

import WatchKit
import UserNotifications

final class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    func applicationDidFinishLaunching() {
        Task {
            do {
                let success = try await UNUserNotificationCenter
                    .current()
                    .requestAuthorization(options: [.badge, .sound, .alert])
                guard success else { return }
                // 4
                await MainActor.run {
                    WKExtension.shared().registerForRemoteNotifications()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func didRegisterForRemoteNotifications(withDeviceToken deviceToken: Data) {
        print(deviceToken.reduce("") { $0 + String(format: "%02x", $1) })
    }
}
