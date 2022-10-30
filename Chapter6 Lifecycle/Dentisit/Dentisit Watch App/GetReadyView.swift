//
//  GetReadyView.swift
//  Dentisit Watch App
//
//  Created by yangjie.layer on 2022/10/30.
//

import SwiftUI

struct GetReadyView: View {
    private let color: Color // 色环颜色
    @State private var stage: Int // 倒计时秒数，屏幕上展示的值
    private let onComplete: (() -> Void)? // 倒计时完成后回调
    private let denominator: Double // 倒计时秒数，保存总值，用来计算色环
    @State private var trim = 1.0 // 色环显示比例
    @State private var text = "Ready" // 色环中心文案
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(color: Color = .green,
         stages: Int = 4,
         onComplete: (() -> Void)? = nil) {
        self.color = color
        self.onComplete = onComplete
        _stage = State(initialValue: stages)
        denominator = Double(stages)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            // 背景色环
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundColor(color.opacity(0.5))
            // 色环
            Circle()
                .trim(from: 0, to: trim)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: trim)
            // 文案
            Text(text)
                .font(.title)
        }
        .onReceive(timer) { _ in tick() }
        .background(.black)
    }
    
    private func tick() {
        stage -= 1 // 更新当前时间
        self.text = "\(self.stage)"
        trim = Double(stage) / denominator // 更新色环
        guard stage > 0 else {
            timer.upstream.connect().cancel()
            WKInterfaceDevice.current().play(.success) // 播放音效
            if let onComplete = onComplete { onComplete() }
            return
        }
        WKInterfaceDevice.current().play(.start) // 播放音效
    }
}

struct GetReadyView_Previews: PreviewProvider {
    static var previews: some View {
        GetReadyView()
    }
}
