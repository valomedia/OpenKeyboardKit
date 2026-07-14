//
//  SubmitLabel+CaseIterable.swift
//  KeyboardKit
//
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension SubmitLabel {
    
    static var allCases: [SubmitLabel] {
        [.continue, .done, .go, .join, .next, .return, .route, .search, .send]
    }
}
