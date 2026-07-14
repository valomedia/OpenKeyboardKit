//
//  MockTraitCollection.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit

class MockTraitCollection: UITraitCollection, @unchecked Sendable {

    var userInterfaceStyleValue: UIUserInterfaceStyle = .light
    
    override var userInterfaceStyle: UIUserInterfaceStyle { userInterfaceStyleValue }
}
#endif
