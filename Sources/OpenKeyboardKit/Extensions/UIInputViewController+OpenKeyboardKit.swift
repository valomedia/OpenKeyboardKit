//
//  UIInputViewController+KeyboardKit.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Foundation
import UIKit

public extension UIInputViewController {

    /// Whether this controller is KeyboardKit enabled.
    var isKeyboardKitEnabledController: Bool {
        self is KeyboardInputViewController
    }
}
#endif
