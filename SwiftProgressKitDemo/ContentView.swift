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
        VStack {
            LinearProgressBar(configuration: getLinearBarConfiguration(),
                              progress: progress)
                .padding(8)
                .frame(width: 250, height: 100, alignment: .center)
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
            
            SemiCircularProgressBar(configuration: getSemiCircularBarConfiguration(), progress: progress)
                .frame(width: 250, height: 100, alignment: .center)
            
            Spacer()
        }
    }
    
    private func getLinearBarConfiguration() -> LinearProgressBarConfiguration {
        return .init(
            foregroundGradient: LinearGradient(
                colors: [Color.green, Color.green.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing),
            backgroundGradient: LinearGradient(
                colors: [Color.gray.opacity(0.4), Color.gray.opacity(0.4)],
                startPoint: .leading,
                endPoint: .trailing),
            progressText: "Please wait while we I am completing the progress",
            progressTextFont: .caption,
            progressTextColor: .black,
            textPlacement: .above,
            barHeight: 20,
            progressAnimation: .easeInOut(duration: 1))
    }
    
    private func getSemiCircularBarConfiguration() -> SemiCircularProgressBarConfiguration {
        return .init(
            foregroundGradient: LinearGradient(
                colors: [Color.green, Color.green.opacity(0.6)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing),
            backgroundGradient: LinearGradient(
                colors: [Color.gray.opacity(0.4), Color.gray.opacity(0.4)],
                startPoint: .leading,
                endPoint: .trailing),
            progressText: "Please wait while we I am completing the progress",
            progressTextFont: .caption,
            progressTextColor: .black,
            textPlacement: .above,
            spacing: 20,
            progressAnimation: .interactiveSpring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
