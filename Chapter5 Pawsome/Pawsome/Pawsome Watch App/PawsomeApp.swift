//
//  PawsomeApp.swift
//  Pawsome Watch App
//
//  Created by yangjie.layer on 2022/10/15.
//

import SwiftUI

@main
struct PawsomeApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) private var extensionDelegate
    
    private let local = LocalNotifications()
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
        
        WKNotificationScene(
            controller: NotificationController.self,
            category: "myCategory"
        )
        
        WKNotificationScene(
            controller: NotificationController.self,
            category: LocalNotifications.categoryIdentifier
        )
    }
}
