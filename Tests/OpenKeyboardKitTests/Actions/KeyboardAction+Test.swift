//
//  KeyboardAction+Test.swift
//  KeyboardKit
//
//  Copyright © 2019-2025 Daniel Saidi. All rights reserved.
//

import EmojiKit
import Foundation
import OpenKeyboardKit

extension KeyboardAction {
    
    static var testActions: [KeyboardAction] {
        [
            .none,
            // .autocompleteSuggestion(.init(text: "a")),
            .dismissKeyboard,
            .character(""),
            .characterMargin(""),
            .command,
            .control,
            .custom(named: ""),
            .dictation,
            .dismissKeyboard,
            .emoji(Emoji("")),
            .escape,
            .function,
            .image(description: "", keyboardImageName: "", imageName: ""),
            .text(""),
            
            .keyboardType(.alphabetic),
            .keyboardType(.numeric),
            .keyboardType(.symbolic),
            .keyboardType(.email),
            .keyboardType(.emojis),
            .keyboardType(.images),
            .keyboardType(.custom(named: "")),
            
            .moveCursorBackward,
            .moveCursorForward,
            .nextKeyboard,
            .nextLocale,
            .option,
            .primary(.done),
            .primary(.go),
            .primary(.newLine),
            .primary(.ok),
            .primary(.search),
            .primary(.return),
            
            .capsLock,
            .shift(.auto),
            .space,
            .systemImage(description: "", keyboardImageName: "", imageName: ""),
            .systemSettings,
            .tab,
            .url(URL(string: ""))
        ]
    }
}
