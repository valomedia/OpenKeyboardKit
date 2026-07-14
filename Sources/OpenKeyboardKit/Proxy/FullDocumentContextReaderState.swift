//
//  FullDocumentContextReaderState.swift
//  KeyboardKit
//
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import Foundation

/// This static class is used as `UITextDocumentProxy` state
/// when reading the full document context.
///
/// The full document context reading capability is provided
/// as an add-on by KeyboardKit Pro.
final class FullDocumentContextReaderState {

    private init() {}

    static var isReadingFullDocumentContext = false
}
