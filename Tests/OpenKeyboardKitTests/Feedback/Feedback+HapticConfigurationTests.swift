//
//  Feedback+HapticConfigurationTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class Feedback_HapticConfigurationTests: XCTestCase {

    typealias Config = Feedback.HapticConfiguration
    
    func testDefaultInitilizerUsesStandardFeedback() {
        let config = Config()
        XCTAssertEqual(config, .standard)
    }

    func testStandardConfigurationEnablesSomeFeedback() {
        let config = Config.standard
        XCTAssertEqual(config.press, .selectionChanged)
        XCTAssertEqual(config.release, .selectionChanged)
        XCTAssertEqual(config.doubleTap, .none)
        XCTAssertEqual(config.longPress, .mediumImpact)
        XCTAssertEqual(config.repeat, .selectionChanged)
    }

    func testDisabledConfigurationUsesMinimalFeedback() {
        let config = Config.disabled
        XCTAssertEqual(config.press, .none)
        XCTAssertEqual(config.release, .none)
        XCTAssertEqual(config.doubleTap, .none)
        XCTAssertEqual(config.longPress, .none)
        XCTAssertEqual(config.repeat, .none)
    }
}
