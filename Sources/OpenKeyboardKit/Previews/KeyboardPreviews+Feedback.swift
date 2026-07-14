//
//  Previews+Feedback.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import CoreGraphics

public extension FeedbackService where Self == Feedback.DisabledFeedbackService {

    static var preview: Self {
        Feedback.DisabledFeedbackService()
    }
}
