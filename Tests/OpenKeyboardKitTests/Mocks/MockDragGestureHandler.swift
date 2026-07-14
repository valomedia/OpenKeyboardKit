//
//  MockDragGestureHandler.swift
//  KeyboardKit
//
//

import CoreGraphics
@testable import OpenKeyboardKit

class MockSpaceDragGestureHandler: Gestures.SpaceDragGestureHandler, Mockable {

    var mock = Mock()
    
    lazy var handleDragGestureRef = MockReference(handleDragGesture)
    
    override func handleDragGesture(from startLocation: CGPoint, to currentLocation: CGPoint) {
        call(handleDragGestureRef, args: (startLocation, currentLocation))
    }
}
