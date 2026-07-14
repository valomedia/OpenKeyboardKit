//
//  EmojiTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import EmojiKit
import OpenKeyboardKit
import XCTest

final class EmojiTests: XCTestCase {

    func testEmojiUsesCharAsUniqueIdentifier() {
        let emojis = "🕓😀🐻🍔⚽️🚗💡💱🏳️".chars.map { Emoji($0) }
        emojis.forEach {
            XCTAssertEqual($0.id, $0.char)
        }
    }
}
