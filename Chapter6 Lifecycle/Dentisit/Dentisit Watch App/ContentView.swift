//
//  ContentView.swift
//  Dentisit Watch App
//
//  Created by yangjie.layer on 2022/10/30.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @ObservedObject private var model = ContentModel()
    @State var showGettingReady = false
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    showGettingReady = true
                } label: {
                    Text("Start brushing")
                }
                .disabled(model.roundsLeft != 0)
                .padding()
                if let endOfBrushing = model.endOfBrushing,
                   let endOfRound = model.endOfRound {
                    Text("Rounds Left: \(model.roundsLeft - 1)")
                    Text("Total time left: \(endOfBrushing, style: .timer)")
                    Text("This round time left: \(endOfRound, style: .timer)")
                }
            }
            if showGettingReady {
                GetReadyView {
                    showGettingReady = false
                    model.startBrushing()
                }
            } else {
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
