//
//  String+Split.swift
//  EmojiKit
//
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import Foundation

extension String {

    func split(by separators: [String]) -> [String] {
        let separators = CharacterSet(charactersIn: separators.joined())
        return components(separatedBy: separators)
    }
}
