//
//  Keyboard+CaseTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class Keyboard_CaseTests: XCTestCase {

    func testIsUpperCasedOrCapsLockedIsValid() {
        func result(for case: Keyboard.KeyboardCase) -> Bool {
            return `case`.isUppercasedOrCapslocked
        }
        XCTAssertFalse(result(for: .auto))
        XCTAssertTrue(result(for: .capsLocked))
        XCTAssertFalse(result(for: .lowercased))
        XCTAssertTrue(result(for: .uppercased))
    }
}
