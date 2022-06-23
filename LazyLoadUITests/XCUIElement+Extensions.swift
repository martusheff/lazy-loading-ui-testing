//
//  XCUIElement+Extensions.swift
//  LazyLoad
//
//  Created by Andronick Martusheff on 6/22/22.
//

import Foundation
import XCTest

extension XCUIElement {
    func swipeUpTo(element: XCUIElement, maxAttempts: Int, velocity: XCUIGestureVelocity) {
        for _ in 0...maxAttempts {
            guard !element.exists else { return }
            self.swipeUp(velocity: velocity)
        }
    }
    
    func swipeDownTo(element: XCUIElement, maxAttempts: Int, velocity: XCUIGestureVelocity) {
        for _ in 0...maxAttempts {
            guard !element.exists else { return }
            self.swipeDown(velocity: velocity)
        }
    }
}

