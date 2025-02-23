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
                    ZStack {
                        if let gradientBackground = configuration.backgroundGradient {
                            Capsule()
                                .fill(gradientBackground)
                        } else {
                            Capsule()
                                .fill(configuration.backgroundColor)
                        }
                    }
                    
                    // Foreground Bar
                    ZStack(alignment: .leading) {
                        if let gradient = configuration.foregroundGradient {
                            Capsule()
                                .fill(gradient)
                        } else if let color = configuration.foregroundColor {
                            Capsule()
                                .fill(color)
                        }
                    }
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
    
    private func progressBarWidth(geometryProxy: GeometryProxy) -> CGFloat {
        return min(geometryProxy.size.width * progress, geometryProxy.size.width)
    }
    
    private var progressText: some View {
        Text(configuration.progressText ?? "\(Int(progress * 100))%")
            .font(configuration.progressTextFont)
            .foregroundColor(configuration.progressTextColor)
    }
}

struct LinearProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearProgressBar(configuration: .stub(),
                              progress: 0.04)
                .padding(8)
                .frame(width: 200)
        }
    }
}
