//
//  String+CharacterMap.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class String_CharsTests: XCTestCase {

    func testCanSplitStringIntoIndividualCharacters() {
        let string = "foo"
        let result = string.chars
        XCTAssertEqual(result, ["f", "o", "o"])
    }

    func testCanSplitStringIntoIndividualActions() {
        let string = "f o"
        let result = string.charActions
        XCTAssertEqual(result, [.character("f"), .character(" "), .character("o")])
        let result2 = string.charActions(removeSpaces: true)
        XCTAssertEqual(result2, [.character("f"), .character("o")])
    }
}
