//
//  NotificationController.swift
//  Pawsome Watch App
//
//  Created by yangjie.layer on 2022/10/16.
//

import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    
    override class var isInteractive: Bool { true }
    
    var image: Image!
    var message: String!
    
    override var body: NotificationView {
        return NotificationView(message: message, image: image)
    }
    
    override func didReceive(_ notification: UNNotification) {
        let content = notification.request.content
        message = content.body
        let num = content.userInfo["imageNumber"] as! Int
        image = Image("cat\(num)")
    }
    
    override func willActivate() {
        super.willActivate()
    }
    
    override func didDeactivate() {
        super.didDeactivate()
    }
    
    override class var sashColor: Color? { Color.green }
    override class var titleColor: Color? { Color.purple }
    override class var subtitleColor: Color? { Color.orange }
    override class var wantsSashBlur: Bool { true }
}
