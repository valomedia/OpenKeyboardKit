//
//  GestureButton+KeyboardKit.swift
//  KeyboardKit
//
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import GestureButton
import SwiftUI

public extension View {
    
    /// Customize the keyboard button gesture configuration.
    func keyboardButtonGestureConfiguration(
        _ config: GestureButtonConfiguration
    ) -> some View {
        self.gestureButtonConfiguration(config)
    }
}
