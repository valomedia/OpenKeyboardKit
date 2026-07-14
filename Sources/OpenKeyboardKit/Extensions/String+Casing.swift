//
//  String+Casing.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {

    /// Whether or not the string is in its lowercased form.
    var isLowercasedWithUppercaseVariant: Bool {
        self == lowercased() && self != uppercased()
    }
    
    /// Whether or not the string is in its uppercased form.
    var isUppercasedWithLowercaseVariant: Bool {
        self == uppercased() && self != lowercased()
    }
}
