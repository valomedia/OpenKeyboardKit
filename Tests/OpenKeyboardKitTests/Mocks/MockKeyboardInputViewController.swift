//
//  MockKeyboardInputViewController.swift
//  KeyboardKit
//
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import OpenKeyboardKit
import UIKit

class MockKeyboardInputViewController: KeyboardInputViewController, Mockable {
    
    lazy var dismissKeyboardRef = MockReference(dismissKeyboard)
    lazy var performAutocompleteRef = MockReference(performAutocomplete)
    
    let mock = Mock()
    
    var textDocumentProxyReplacement: UITextDocumentProxy?
    
    override var textDocumentProxy: UITextDocumentProxy { textDocumentProxyReplacement ?? super.textDocumentProxy }
    
    override func dismissKeyboard() {
        call(dismissKeyboardRef, args: ())
    }
    
    override func performAutocomplete() {
        call(performAutocompleteRef, args: ())
    }
}
#endif
