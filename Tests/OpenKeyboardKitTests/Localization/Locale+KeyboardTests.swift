//
//  Locale+KeyboardTests.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class LocaleInfo_KeyboardTests: XCTestCase {

    let english = Locale.english
    let swedish = Locale.swedish

    func testPrefersAlternateQuotationReplacement() {
        func result(for locale: Locale) -> Bool {
            locale.prefersAlternateQuotationReplacement
        }
        XCTAssertFalse(result(for: english))
        XCTAssertTrue(result(for: swedish))
    }
}
