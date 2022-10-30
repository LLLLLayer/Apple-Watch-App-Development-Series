//
//  ExtensionDelegate.swift
//  Lifecycle Watch App
//
//  Created by yangjie.layer on 2022/10/30.
//

import WatchKit

final class ExtensionDelegate: NSObject, WKExtensionDelegate {
    
    func applicationDidFinishLaunching() {
        print(#function)
    }
    
    func applicationWillEnterForeground() {
        print(#function)
    }
    
    func applicationDidBecomeActive() {
        print(#function)
    }
    
    func applicationWillResignActive() {
        print(#function)
    }
    
    func applicationDidEnterBackground() {
        print(#function)
    }
}
