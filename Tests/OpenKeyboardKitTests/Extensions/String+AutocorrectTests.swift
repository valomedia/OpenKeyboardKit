//
//  String+AutocorrectTests.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class String_AutocorrectTests: XCTestCase {

    func testStringDefinesTriggers() {
        let delimiters = String.autocorrectTriggers.joined()
        let expectedPrefix = ".,:;!¡?¿{}<>«»"
        XCTAssertTrue(delimiters.hasPrefix(expectedPrefix))
    }

    func testStringCanIdentifyAsTrigger() {
        let result = String.autocorrectTriggers.map { $0.isAutocorrectTrigger }
        XCTAssertTrue(result.allSatisfy { $0 })
        XCTAssertFalse("a".isAutocorrectTrigger)
    }
}
