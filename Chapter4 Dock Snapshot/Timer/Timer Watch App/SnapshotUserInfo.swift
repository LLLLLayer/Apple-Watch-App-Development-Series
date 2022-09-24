//
//  SnapshotUserInfo.swift
//  Timer Watch App
//
//  Created by yangjie.layer on 2022/9/24.
//

import Foundation

enum SnapshotError: Error {
    case noHandler, badDestination, noUserInfo
}

struct SnapshotUserInfo {
    let handler: () -> Void
    let content: String
    
    init(
        handler: @escaping () -> Void,
        content: String
    ) {
        self.handler = handler
        self.content = content
    }
    
    private enum Keys: String {
        case handler, content
    }

    func encode() -> [AnyHashable: Any] {
        return [
            Keys.handler.rawValue: handler,
            Keys.content.rawValue: content,
        ]
    }
    
    static func from(notification: Notification) throws -> Self {
      guard let userInfo = notification.userInfo else {
        throw SnapshotError.noUserInfo
      }
      guard let handler = userInfo[Keys.handler.rawValue] as? () -> Void else {
        throw SnapshotError.noHandler
      }
      guard
        let content = userInfo[Keys.content.rawValue] as? String
      else {
        throw SnapshotError.badDestination
      }
      return .init(
        handler: handler,
        content: content
      )
    }
}
