//
//  KeyboardInputViewController+ViewTests.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI
import UIKit
import XCTest
@testable import OpenKeyboardKit

class KeyboardInputViewController_ViewTests: XCTestCase {

    var vc: KeyboardInputViewController!

    override func setUp() {
        vc = KeyboardInputViewController()
    }

    func testSettingUpKeyboardViewRemovesAllOtherViewControllers() {
        let subview = UIView()
        XCTAssertFalse(vc.view.subviews.contains(subview))
        vc.view.addSubview(subview)
        XCTAssertTrue(vc.view.subviews.contains(subview))
        vc.setupKeyboardView { _ in Text("Hello") }
        XCTAssertFalse(vc.view.subviews.contains(subview))
    }
    
    func testSettingUpKeyboardViewAddsChildControllerWithEnvironmentData() {
        XCTAssertEqual(vc.children.count, 0)
        vc.setupKeyboardView { _ in Text("Hello") }
        XCTAssertEqual(vc.children.count, 1)
        XCTAssertFalse(vc.children[0] is KeyboardHostingController<Text>)
    }
    
    func testSettingUpKeyboardViewAbortsIfDisableFlagIsSet() {
        XCTAssertEqual(vc.children.count, 0)
        vc.setupKeyboardViewIsEnabled = false
        vc.setupKeyboardView { _ in Text("Hello") }
        XCTAssertEqual(vc.children.count, 0)
    }
}
#endif
