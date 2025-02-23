//
//  CircularProgressBar.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 23/02/25.
//

import SwiftUI

public struct CircularProgressBar: View {
    private let configuration: CircularProgressBarConfiguration
    private var progress: Double
    
    public init(configuration: CircularProgressBarConfiguration, progress: Double) {
        self.configuration = configuration
        self.progress = progress
    }
    
    public var body: some View {
        GeometryReader { reader in
            ZStack {
                /// Background Circle
                backgroundCircle()
                
                /// Foreground Progress Circle
                foregroundCircle()
                    .animation(configuration.progressAnimation)
                
                /// Progress Text
                if configuration.textPlacement != .none {
                    progressText
                        .padding(.horizontal, 10)
                }
            }
            .frame(width: reader.size.width, height: reader.size.width)
        }
    }
    
    // MARK: - SubViews
    
    private func circularView<Content: ShapeStyle>(content: Content, trimTo: Double) -> some View {
        Circle()
            .trim(from: 0, to: trimTo)
            .stroke(
                content,
                style: StrokeStyle(lineWidth: configuration.lineWidth, lineCap: configuration.lineCap)
            )
            .rotationEffect(.degrees(-90)) // Start from top
    }
    
    private func backgroundCircle() -> some View {
        ZStack {
            if let backgroundGradient = configuration.backgroundGradient {
                circularView(content: backgroundGradient, trimTo: 1.0)
            } else {
                circularView(content: configuration.backgroundColor, trimTo: 1.0)
            }
        }
    }
    
    private func foregroundCircle() -> some View {
        ZStack {
            if let foregroundGradient = configuration.foregroundGradient {
                circularView(content: foregroundGradient, trimTo: progress)
            } else {
                circularView(content: configuration.foregroundColor, trimTo: progress)
            }
        }
    }
    
    private var progressText: some View {
        Text(configuration.progressText ?? "\(Int(progress * 100))%")
            .font(configuration.progressTextFont)
            .foregroundColor(configuration.progressTextColor)
    }
}

public struct CircularProgressBarConfiguration {
    public var backgroundColor: Color
    public var foregroundColor: Color
    public var foregroundGradient: LinearGradient?
    public var backgroundGradient: LinearGradient?
    public var lineCap: CGLineCap
    public var progressText: String?
    public var progressTextFont: Font
    public var progressTextColor: Color
    public var textPlacement: TextPlacement
    public var lineWidth: CGFloat
    public var progressAnimation: Animation?
    
    public init(
        backgroundColor: Color = .gray,
        foregroundColor: Color = .blue,
        foregroundGradient: LinearGradient? = nil,
        backgroundGradient: LinearGradient? = nil,
        lineCap: CGLineCap = .round,
        progressText: String? = nil,
        progressTextFont: Font = .body,
        progressTextColor: Color = .primary,
        textPlacement: TextPlacement = .center,
        lineWidth: CGFloat = 15.0,
        progressAnimation: Animation? = .easeInOut(duration: 1.0)
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.foregroundGradient = foregroundGradient
        self.backgroundGradient = backgroundGradient
        self.lineCap = lineCap
        self.progressText = progressText
        self.progressTextFont = progressTextFont
        self.progressTextColor = progressTextColor
        self.textPlacement = textPlacement
        self.lineWidth = lineWidth
        self.progressAnimation = progressAnimation
    }
    
    public enum TextPlacement {
        case center  // Text appears inside the circle
        case none    // No text
    }
}

