//
//  FeedbackContextTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class FeedbackContextTests: XCTestCase {

    override func tearDown() {
        FeedbackContext().settings.isAudioFeedbackEnabled = true
        FeedbackContext().settings.isHapticFeedbackEnabled = false
    }

    func testContextUsesExpectedConfigurationsByDefault() {
        let settings = FeedbackContext()
        XCTAssertEqual(settings.audioConfiguration, .standard)
        XCTAssertEqual(settings.hapticConfiguration, .standard)
    }
}
