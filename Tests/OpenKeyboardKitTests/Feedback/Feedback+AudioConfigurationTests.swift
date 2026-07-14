//
//  Feedback+AudioConfigurationTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import OpenKeyboardKit
import XCTest

class Feedback_AudioConfigurationTests: XCTestCase {

    typealias Config = Feedback.AudioConfiguration
    
    func testDefaultInitializerUsesStandardFeedback() {
        let config = Config()
        XCTAssertEqual(config, .standard)
    }

    func testStandardConfigurationEnablesFeedback() {
        let config = Config()
        XCTAssertEqual(config.input, Feedback.Audio.input)
        XCTAssertEqual(config.delete, Feedback.Audio.delete)
        XCTAssertEqual(config.system, Feedback.Audio.system)
    }

    func testDisabledConfigurationUsesDisabledFeedback() {
        let config = Config.disabled
        XCTAssertEqual(config.input, Feedback.Audio.none)
        XCTAssertEqual(config.delete, Feedback.Audio.none)
        XCTAssertEqual(config.system, Feedback.Audio.none)
    }
}
