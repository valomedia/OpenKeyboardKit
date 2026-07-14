//
//  Callouts+Actions.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Callouts {

    /// This type can be used to define callout actions that
    /// can be shown in an ``Callouts/ActionCallout``.
    ///
    /// You can use standard, ``english`` callout actions or
    /// upgrade to KeyboardKit Pro to unlock callout actions
    /// for all supported locales.
    ///
    /// You can customize the callout actions for any action
    /// with ``SwiftUICore/View/keyboardCalloutActions(_:)``.
    struct Actions: KeyboardModel {

        /// Create callout actions from an action dictionary.
        ///
        /// This initializer applies the provided actions as
        /// they are, without any modifications.
        public init(
            actions: [KeyboardAction: [KeyboardAction]]
        ) {
            self.actionsDictionary = actions
        }

        /// Create callout actions from a string dictionary.
        ///
        /// This initializer applies the provided actions as
        /// they are, without any modifications, and appends
        /// the additional action/actions strings dictionary,
        /// where the actions for each action are defined in
        /// a single string without any separator.
        public init(
            actions: [KeyboardAction: [KeyboardAction]] = [:],
            characters: [String: String]
        ) {
            var actions = actions
            for (key, value) in characters {
                let lowerKey = key.lowercased()
                let upperKey = key.uppercased()
                actions[.character(lowerKey)] = value.lowercased().map { .character(char: $0) }
                actions[.character(upperKey)] = value.uppercased().map { .character(char: $0) }
            }
            self.init(actions: actions)
        }

        /// An action mapping dictionary.
        public var actionsDictionary: [KeyboardAction: [KeyboardAction]]

        /// Whether diacritic key match is enabled.
        public var isDiacriticInsensitive = false
    }
}

public extension Callouts.Actions {

    /// Base callout actions, without any alphabetic actions.
    static let base = Self.init(
        actions: [.urlDomain: .urlDomainActions],
        characters: Self.baseNumericAndSymbolicChars
    )

    /// Base numeric and symbolic callout actions characters.
    static var baseNumericAndSymbolicChars: [String: String] {
        [
            "0": "0°",

            "$": "$€£¥₩₽¢",
            "₱": "₱$€£¥₽",
            "₽": "₽$¥€¢£₩",
            "¥": "¥$₽€¢£₩",
            "€": "€$£₽¥¢₩",
            "¢": "¢$₽¥€£₩",
            "£": "£€$₽¥¢₩",
            "₩": "₩$₽¥€¢£",
            "₾": "₾$€£¥",
            "₴": "₴₽₩£$€¥",
            "₫": "₫$€£¥₩₽¢",

            "-": "-–—•",
            "/": "/\\",
            "&": "&§",
            "”": "\"„“”«»",
            ".": ".…",
            "?": "?¿",
            "!": "!¡",
            "’": "'’‘`",

            "%": "%‰",
            "=": "=≠≈"
        ]
    }

    /// English callout actions.
    static let english: Self = {
        var actions = Self.base
        let alpha = Self.init(characters: Self.englishAlphabeticCharacters)
        actions.actionsDictionary.merge(alpha.actionsDictionary) { (_, new) in new }
        return actions
    }()

    /// English, alphabetic callout actions characters.
    static var englishAlphabeticCharacters: [String: String] = {
        [
            "a": "aàáâäǎæãåāăą",
            "c": "cçćčċ",
            "d": "dďð",
            "e": "eèéêëēėę",
            "g": "gğġ",
            "h": "hħ",
            "i": "iîìíïǐĩī",
            "k": "kķ",
            "l": "lłļľ",
            "n": "nñńņň",
            "o": "oòóôöǒœøõōő",
            "r": "rř",
            "s": "sßśšŝṣș",
            "t": "tțťþ",
            "u": "uǔûùúüũūu",
            "w": "wŵ",
            "y": "yýŷÿ",
            "z": "zźžż"
        ]
    }()
}

public extension Callouts.Actions {

    /// Get keyboard callout actions for the provided action.
    func actions(
        for action: KeyboardAction
    ) -> [KeyboardAction]? {
        if let result = actionsDictionary[action] { return result }
        guard isDiacriticInsensitive else { return nil }
        return diacriticInsensitiveActions(for: action)
    }
}

private extension Callouts.Actions {

    /// Perform a diacritic insensitive dictionary key match
    /// by iterating over all the keys in the dictionary. It
    /// is a slow method that is needed for some RTL locales.
    func diacriticInsensitiveActions(
        for action: KeyboardAction
    ) -> [KeyboardAction]? {
        guard case .character(let actionChar) = action else { return nil }
        return actionsDictionary.keys.compactMap {
            if case .character(let char) = $0 { return char }
            return nil
        }
        .first { $0.compare(actionChar, options: .diacriticInsensitive) == .orderedSame }
        .flatMap { actionsDictionary[.character($0)] }
    }
}

public extension Callouts {

    /// This type is used to customize callout actions using
    /// ``SwiftUICore/View/keyboardCalloutActions(_:)``.
    typealias ActionsBuilder = (ActionsBuilderParams) -> [KeyboardAction]?

    /// This type is used to customize callout actions using
    /// ``SwiftUICore/View/keyboardCalloutActions(_:)``.
    struct ActionsBuilderParams: KeyboardModel {

        /// Create a callout actions builder parameter value.
        public init(
            action: KeyboardAction
        ) {
            self.action = action
        }

        /// The action to get callout actions for.
        public let action: KeyboardAction

        /// Get the standard callout actions for the context.
        public func standardActions(
            for context: KeyboardContext
        ) -> [KeyboardAction]? {
            .standardCalloutActions(for: action, context: context)
        }
    }
}

public extension EnvironmentValues {

    /// This value can be used to customize callout actions.
    ///
    /// > Note: The builder returns `nil` by default to make
    /// it possible to check if there is an injected builder.
    /// This will become non-optional in KeyboardKit 10 when
    /// the callout services are removed.
    @Entry var keyboardCalloutActionsBuilder: Callouts.ActionsBuilder = { _ in nil }
}

public extension View {

    /// This view modifier can be used to set custom callout
    /// actions to show when long pressing a key.
    ///
    /// You can customize the actions for any action and use
    /// ``Callouts/ActionsBuilderParams/standardActions(for:)``
    /// to return the standard actions for all other actions.
    func keyboardCalloutActions(
        _ builder: @escaping Callouts.ActionsBuilder
    ) -> some View {
        self.environment(\.keyboardCalloutActionsBuilder, builder)
    }
}
