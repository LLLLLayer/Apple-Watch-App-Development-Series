//
//  ContentModel.swift
//  Dentisit Watch App
//
//  Created by yangjie.layer on 2022/10/30.
//


import SwiftUI

final class ContentModel: NSObject, ObservableObject {
    
    @Published var roundsLeft = 0
    @Published var endOfRound: Date?
    @Published var endOfBrushing: Date?
    
    private var timer: Timer!
    private var session: WKExtendedRuntimeSession!
    
    func startBrushing() {
        session = WKExtendedRuntimeSession()
        session.delegate = self
        session.start()
    }
}

extension ContentModel: WKExtendedRuntimeSessionDelegate {
    
    func extendedRuntimeSessionDidStart(
        _ extendedRuntimeSession: WKExtendedRuntimeSession
    ) {
        let secondsPerRound = 30.0
        let now = Date.now
        roundsLeft = 4
        endOfRound = now.addingTimeInterval(secondsPerRound)
        endOfBrushing = now.addingTimeInterval(secondsPerRound * 4)
        let device = WKInterfaceDevice.current()
        device.play(.start)
        
        timer = Timer(
            fire: endOfRound!,
            interval: secondsPerRound,
            repeats: true
        ) { _ in
            self.roundsLeft -= 1
            guard self.roundsLeft == 0 else {
                self.endOfRound = Date.now.addingTimeInterval(secondsPerRound)
                device.play(.success)
                return
            }
            extendedRuntimeSession.invalidate()
            device.play(.success)
            device.play(.success)
        }
        RunLoop.main.add(timer, forMode: .common)
    }
    
    func extendedRuntimeSessionWillExpire(
        _ extendedRuntimeSession: WKExtendedRuntimeSession
    ) {
    }
    
    func extendedRuntimeSession(
        _ extendedRuntimeSession: WKExtendedRuntimeSession,
        didInvalidateWith reason: WKExtendedRuntimeSessionInvalidationReason,
        error: Error?
    ) {
        extendedRuntimeSession.invalidate()
        timer.invalidate()
        timer = nil
        endOfRound = nil
        endOfBrushing = nil
        roundsLeft = 0
    }
}
