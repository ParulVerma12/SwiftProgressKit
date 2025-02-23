//
//  SemiCircularBarConfiguration.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 05/01/25.
//

import Foundation
import SwiftUI

public struct SemiCircularProgressBarConfiguration {
    
    // MARK: - Progress Bar Styles
    
    /// The color of the progress bar's background arc.
    public var backgroundColor: Color
    
    /// The color of the progress bar's foreground arc (progress).
    public var foregroundColor: Color
    
    /// The linear gradient applied to the progress bar's foreground. If set, `foregroundColor` is ignored.
    public var foregroundGradient: LinearGradient?
    
    /// The linear gradient applied to the background arc of the progress bar.
    public var backgroundGradient: LinearGradient?
    
    /// The line cap for the semi circle bar
    public var lineCap: CGLineCap
    
    // MARK: - Progress Text
    
    /// The text displayed on or near the progress bar (e.g., "75%").
    public var progressText: String?
    
    /// The font of the progress text.
    public var progressTextFont: Font
    
    /// The color of the progress text.
    public var progressTextColor: Color
    
    /// The placement of the progress text relative to the progress bar.
    public var textPlacement: TextPlacement
    
    /// The alignment of the text within the desired `TextPlacement`.
    public var textAlignment: TextAlignment
    
    // MARK: - Dimensions
    
    /// The width of the progress bar's arc.
    public var lineWidth: CGFloat
    
    /// The padding around the foreground progress bar arc.
    public var foregroundArcPadding: CGFloat
    
    /// Rotation angle for the semi circle view
    public var rotationAngle: CGFloat
    
    /// Decides spacing between the text and semi circle
    public var spacing: CGFloat
    
    // MARK: - Animations
    
    /// The animation applied when the progress value changes.
    public var progressAnimation: Animation?
    
    // MARK: - Initializer
    
    public init(
        backgroundColor: Color = .gray,
        foregroundColor: Color = .blue,
        foregroundGradient: LinearGradient? = nil,
        backgroundGradient: LinearGradient? = nil,
        lineCap: CGLineCap = .round,
        progressText: String? = nil,
        progressTextFont: Font = .body,
        progressTextColor: Color = .primary,
        textPlacement: TextPlacement = .inside,
        textAlignment: TextAlignment = .center,
        lineWidth: CGFloat = 15.0,
        rotationAngle: CGFloat = 180,
        spacing: CGFloat = 8,
        progressAnimation: Animation? = nil,
        foregroundArcPadding: CGFloat = 4
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
        self.textAlignment = textAlignment
        self.lineWidth = lineWidth
        self.rotationAngle = rotationAngle
        self.spacing = spacing
        self.progressAnimation = progressAnimation
        self.foregroundArcPadding = foregroundArcPadding
    }
    
    // MARK: - Text Placement Enum
    public enum TextPlacement {
        case inside  // Text appears inside the semi-circle
        case above   // Text appears above the semi-circle
        case below   // Text appears below the semi-circle
        case left    // Text appears to the left of the semi-circle
        case right   // Text appears to the right of the semi-circle
        case none    // No text
    }
}

// MARK: - STUB Data

extension SemiCircularProgressBarConfiguration {
    static func stub() -> Self {
        return .init(
            foregroundGradient: LinearGradient(
                colors: [Color.green, Color.blue],
                startPoint: .leading,
                endPoint: .trailing
            ),
            backgroundGradient: LinearGradient(
                colors: [Color.gray, Color.black],
                startPoint: .leading,
                endPoint: .trailing
            ),
            progressText: "Please wait while we are uploading the data....",
            progressTextFont: .caption,
            progressTextColor: .black,
            textPlacement: .inside,
            lineWidth: 20,
            progressAnimation: .easeInOut(duration: 1.0)
        )
    }
}
