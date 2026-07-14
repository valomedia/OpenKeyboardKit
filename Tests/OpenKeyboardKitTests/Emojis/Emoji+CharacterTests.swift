//
//  Emoji+CharacterTests.swift
//  KeyboardKit
//
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import EmojiKit
import OpenKeyboardKit
import XCTest

final class Emoji_CharacterTests: XCTestCase {

    let combined = "☺️".char
    let nonCombined = "😀".char
    let simple = "😀".char
    let nonSimple = "⌚️".char

    func testIsCombinedEmojiReturnsTrueForSimpleAndCombinedEmojis() {
        XCTAssertTrue(combined.isCombinedEmoji)
        XCTAssertFalse(nonCombined.isCombinedEmoji)
    }

    func testIsSimpleEmojiReturnsTrueForSimpleAndCombinedEmojis() {
        XCTAssertTrue(simple.isSimpleEmoji)
        XCTAssertFalse(nonSimple.isSimpleEmoji)
    }
}

private extension String {

    var char: Character { Array(self)[0] }
}
