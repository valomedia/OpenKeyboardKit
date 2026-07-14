//
//  KeyboardAction+InputCalloutTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import EmojiKit
import OpenKeyboardKit
import XCTest

final class KeyboardAction_InputCalloutTests: XCTestCase {

    func testInputCalloutTextIsOnlySpecifiedForCharacterActions() {
        let char = KeyboardAction.character("foo")
        let emoji = KeyboardAction.emoji(Emoji("😀"))
        let others = KeyboardAction.testActions.filter {
            $0 != .character("") && !$0.isEmojiAction
        }
        XCTAssertEqual(char.inputCalloutText, "foo")
        XCTAssertEqual(emoji.inputCalloutText, "😀")
        others.forEach {
            XCTAssertNil($0.inputCalloutText)
        }
    }
}
