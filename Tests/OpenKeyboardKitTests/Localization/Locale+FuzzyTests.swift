//
//  Locale+FuzzyTests.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class Locale_FuzzyTests: XCTestCase {

    func testCanResolveLocaleWithFuzzyName() {
        func result(for name: String) -> String? {
            Locale(fuzzyName: name)?.identifier
        }
        XCTAssertEqual(result(for: "Swedish"), "sv")
        XCTAssertEqual(result(for: "swedish"), "sv")
        XCTAssertEqual(result(for: "english gb"), "en_GB")
    }
}
