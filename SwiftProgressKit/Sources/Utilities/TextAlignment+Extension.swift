//
//  TextAlignment+Extension.swift
//  SwiftProgressKit
//
//  Created by Parul Verma on 05/01/25.
//

import Foundation
import SwiftUI

extension TextAlignment {
    var widgetAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
