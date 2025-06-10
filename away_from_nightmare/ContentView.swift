//
//  ContentView.swift
//  away_from_nightmare
//
//  Created by Yonghai Yang on 2025/6/10.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recognizer = SpeechRecognizer()
    @State private var isListening = false

    var body: some View {
        VStack(spacing: 30) {
            Text("🗣️ 实时梦话识别")
                .font(.largeTitle)
                .bold()

            ScrollView {
                Text(recognizer.transcript)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
            }

            Button(action: {
                isListening.toggle()
                if isListening {
                    recognizer.startTranscribing()
                } else {
                    recognizer.stopTranscribing()
                }
            }) {
                Text(isListening ? "🛑 停止识别" : "🎙️ 开始识别")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isListening ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
    }
}
