//
//  LinearProgressBarConfiguration.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 30/12/24.
//

import Foundation
import SwiftUI

public struct LinearProgressBarConfiguration {
    
    // MARK: - Progress Bar Colors
    
    /// The color of the progress bar's background.
    public var backgroundColor: Color
    
    /// The color of the progress bar's foreground (progress).
    public var foregroundColor: Color
    
    /// The linear gradient applied to the progress bar's foreground. If set, `foregroundColor` is ignored.
    public var foregroundGradient: LinearGradient?
    
    // The linear gradient applied to the background of the progress bar.
    
    public var backgroundGradient: LinearGradient?
    
    // MARK: - Progress Text
    
    /// The text displayed on or near the progress bar (e.g., "75%").
    public var progressText: String?
    
    /// The font of the progress text.
    public var progressTextFont: Font
    
    /// The color of the progress text.
    public var progressTextColor: Color
    
    /// The placement of the progress text relative to the progress bar.
    public var textPlacement: TextPlacement
    
    // MARK: - Dimensions
    
    /// The height of the progress bar.
    public var barHeight: CGFloat
    
    // Adjust the padding around the foregroud progress bar
    public var foregroundBarPadding: CGFloat
    
    // MARK: - Animations
    
    public var progressAnimation: Animation?
    
    // MARK: - Initializer
    public init(
        backgroundColor: Color = .green,
        foregroundColor: Color = .blue,
        foregroundGradient: LinearGradient? = nil,
        backgroundGradient: LinearGradient? = nil,
        progressText: String? = nil,
        progressTextFont: Font = .body,
        progressTextColor: Color = .primary,
        textPlacement: TextPlacement = .inside,
        barHeight: CGFloat = 10.0,
        progressAnimation: Animation? = nil,
        foregroundBarPadding: CGFloat = 4
    ) {
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.foregroundGradient = foregroundGradient
        self.backgroundGradient = backgroundGradient
        self.progressText = progressText
        self.progressTextFont = progressTextFont
        self.progressTextColor = progressTextColor
        self.textPlacement = textPlacement
        self.barHeight = barHeight
        self.progressAnimation = progressAnimation
        self.foregroundBarPadding = foregroundBarPadding
    }
    
    // MARK: - Text Placement Enum
    public enum TextPlacement {
        case inside   // Text appears inside the progress bar
        case above    // Text appears above the progress bar
        case below    // Text appears below the progress bar
        case left    // Text appears below the progress bar
        case right    // Text appears below the progress bar
        case none     // No text is displayed
    }
}

/// MARK: - STUB Data

extension LinearProgressBarConfiguration {
    static func stub() -> Self {
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
