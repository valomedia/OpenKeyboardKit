//
//  FeedbackService.swift
//  KeyboardKit
//
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import Foundation

/// This protocol can be implemented by any type that can be
/// used to trigger audio and haptic feedback.
///
/// KeyboardKit will automatically setup a standard protocol
/// implementation in ``KeyboardInputViewController/services``
/// when the keyboard is launched.
public protocol FeedbackService: AnyObject {

    /// Trigger the provided audio feedback.
    func triggerAudioFeedback(_ feedback: Feedback.Audio)

    /// Trigger the provided haptic feedback.
    func triggerHapticFeedback(_ feedback: Feedback.Haptic)
}
