//
//  Emoji+KeyboardWrapper.swift
//  KeyboardKit
//
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import EmojiKit
import SwiftUI

public extension Emoji {
    
    /// This view is used as a keyboard emoji view eraser to
    /// ensure that the view is only used for valid licenses.
    struct KeyboardWrapper: View {
        
        init(
            actionHandler: KeyboardActionHandler,
            keyboardContext: KeyboardContext,
            calloutContext: CalloutContext?,
            styleService: KeyboardStyleService
        ) {}

        public var body: some View {
            EmptyView()
        }
        
        static var isEmptyPlaceholder: Bool { true }
    }
}
