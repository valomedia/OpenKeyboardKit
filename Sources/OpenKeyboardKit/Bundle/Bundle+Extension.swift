//
//  Bundle+Resources.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Bundle {

    /// Get whether or not the bundle is an extension.
    var isExtension: Bool {
        bundlePath.hasSuffix(".appex")
    }
}
