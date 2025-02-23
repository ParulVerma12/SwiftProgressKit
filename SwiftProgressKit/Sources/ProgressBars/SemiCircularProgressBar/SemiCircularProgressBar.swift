//
//  SemiCircularProgressBar.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 05/01/25.
//

import SwiftUI

public struct SemiCircularProgressBar: View {
    private let configuration: SemiCircularProgressBarConfiguration
    private var progress: Double
    
    public init(configuration: SemiCircularProgressBarConfiguration, progress: Double) {
        self.configuration = configuration
        self.progress = progress
    }
    
    public var body: some View {
        GeometryReader { reader in
            VStack(spacing: configuration.textPlacement == .above ? configuration.spacing : 0) {
                if configuration.textPlacement == .above {
                    progressText
                }
                
                ZStack {
                    /// Background Arc
                    backgroundArc()
                    
                    /// Foreground Arc
                    foregroundArc()
                        .animation(configuration.progressAnimation)
                }
                .frame(width: reader.size.width, height: reader.size.width / 2)
                .overlay(
                    ZStack {
                        // Inside Text
                        if configuration.textPlacement == .inside {
                            progressText
                                .frame(width: reader.size.width * 0.35,
                                       height: reader.size.height / 2)
                                .offset(y: -reader.size.height * 0.01)
                                .padding(.horizontal, 8)
                        }
                    }
                )
                
                if configuration.textPlacement == .below {
                    progressText
                        .padding(.top, 8)
                }
            }
        }
    }
    
    // MARK: - SubViews
    
    private func semiCircleView<Content: ShapeStyle>(content: Content, trimFrom: Double, trimTo: Double) -> some View {
        Circle()
            .trim(from: trimFrom, to: trimTo)
            .stroke(
                content,
                style: StrokeStyle(lineWidth: configuration.lineWidth, lineCap: configuration.lineCap)
            )
            .rotationEffect(.degrees(configuration.rotationAngle))
    }
    
    private func backgroundArc() -> some View {
        ZStack {
            if let backgroundGradient = configuration.backgroundGradient {
                semiCircleView(content: backgroundGradient, trimFrom: 0, trimTo: 0.5)
            } else {
                semiCircleView(content: configuration.backgroundColor, trimFrom: 0, trimTo: 0.5)
            }
        }
    }
    
    private func foregroundArc() -> some View {
        ZStack {
            if let foregroundGradient = configuration.foregroundGradient {
                semiCircleView(content: foregroundGradient, trimFrom: 0, trimTo: progress / 2)
            } else {
                semiCircleView(content: configuration.foregroundColor, trimFrom: 0, trimTo: progress / 2)
            }
        }
    }
    
    private var progressText: some View {
        Text(configuration.progressText ?? "\(Int(progress * 100))%")
            .font(configuration.progressTextFont)
            .foregroundColor(configuration.progressTextColor)
            .frame(maxWidth: .infinity, alignment: configuration.textAlignment.widgetAlignment)
    }
}

struct SemiCircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        SemiCircularProgressBar(configuration: .stub(), progress: 0.6)
            .frame(width: 300, height: 150, alignment: .center)
    }
}
