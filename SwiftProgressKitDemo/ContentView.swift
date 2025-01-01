//
//  ContentView.swift
//  SwiftProgressKitDemo
//
//  Created by Parul Verma on 29/12/24.
//

import SwiftUI
import SwiftProgressKit

struct ContentView: View {
    @State private var timer: Timer?
    @State private var progress = 0.0
    
    var body: some View {
        LinearProgressBar(configuration: getLinearBarConfiguration(),
                          progress: progress)
            .padding(8)
            .onAppear {
                timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                    if progress < 1.0 {
                        progress += 0.02
                    } else {
                        //timer?.invalidate()
                        progress = 0.0
                    }
                    print("Progress \(progress)")
                }
            }
    }
    
    private func getLinearBarConfiguration() -> LinearProgressBarConfiguration {
        return .init(
            foregroundGradient: LinearGradient(
                colors: [Color.green, Color.blue],
                startPoint: .leading,
                endPoint: .trailing),
            backgroundGradient: LinearGradient(
                colors: [Color.gray, Color.black],
                startPoint: .leading,
                endPoint: .trailing),
            progressText: "Please wait while we I am completing the progress",
            progressTextFont: .caption,
            progressTextColor: .black,
            textPlacement: .above,
            barHeight: 20,
            progressAnimation: .easeInOut(duration: 1))
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
