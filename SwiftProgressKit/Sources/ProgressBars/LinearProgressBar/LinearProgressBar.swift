//
//  LinearProgressBar.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 30/12/24.
//

import SwiftUI

public struct LinearProgressBar: View {
    private let configuration: LinearProgressBarConfiguration
    private var progress = 0.0
    
    public init(configuration: LinearProgressBarConfiguration, progress: Double) {
        self.configuration = configuration
        self.progress = progress
    }
    
    public var body: some View {
        GeometryReader{reader in
            VStack(alignment: .leading, spacing: configuration.textPlacement == .above ? 8 : 0) {
                if configuration.textPlacement == .above {
                    progressText
                }
                
                ZStack(alignment: .topLeading) {
                    // Background Bar
                    backgroundProgressBar()
                    
                    // Foreground Bar
                    foregroundProgressBar()
                        .frame(width: progressBarWidth(geometryProxy: reader))
                        .padding(2)
                    
                    // Inside Text
                    if configuration.textPlacement == .inside {
                        progressText
                            .padding(.horizontal, 4)
                    }
                }
                .frame(height: configuration.barHeight)
                .animation(configuration.progressAnimation)
                
                if configuration.textPlacement == .below {
                    progressText
                        .padding(.top, 8)
                }
            }
        }
    }
    
    // MARK: - SubViews
    
    private func backgroundProgressBar() -> some View {
        ZStack {
            if let gradientBackground = configuration.backgroundGradient {
                Capsule()
                    .fill(gradientBackground)
            } else {
                Capsule()
                    .fill(configuration.backgroundColor)
            }
        }
    }
    
    private func foregroundProgressBar() -> some View {
        ZStack(alignment: .leading) {
            if let gradient = configuration.foregroundGradient {
                Capsule()
                    .fill(gradient)
            } else if let color = configuration.foregroundColor {
                Capsule()
                    .fill(color)
            }
        }
    }
    
    private func progressBarWidth(geometryProxy: GeometryProxy) -> CGFloat {
        return min(geometryProxy.size.width * progress, geometryProxy.size.width)
    }
    
    private var progressText: some View {
        Text(configuration.progressText ?? "\(Int(progress * 100))%")
            .font(configuration.progressTextFont)
            .foregroundColor(configuration.progressTextColor)
            .frame(maxWidth: .infinity, alignment: configuration.textAlignment.widgetAlignment)
    }
}

struct LinearProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearProgressBar(configuration: .init(
                foregroundGradient: LinearGradient(
                    colors: [Color.green, Color.blue],
                    startPoint: .leading,
                    endPoint: .trailing),
                backgroundGradient: LinearGradient(
                    colors: [Color.gray, Color.black],
                    startPoint: .leading,
                    endPoint: .trailing),
                progressText: "Please wait...",
                progressTextFont: .caption,
                progressTextColor: .black,
                textPlacement: .above,
                textAlignment: .center,
                barHeight: 20,
                progressAnimation: .easeInOut(duration: 1)),
                              progress: 0.04)
                .padding(8)
                .frame(width: 200)
        }
    }
}
