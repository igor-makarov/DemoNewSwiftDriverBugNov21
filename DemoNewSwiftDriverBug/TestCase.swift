//
//  TestCase.swift
//  DemoNewSwiftDriverBug
//
//  Created by Igor Makarov on 21/11/2021.
//

import Foundation

import UIKit

open class DemoClass {

    private func someFunc() {
        // build ok
        if #available(iOS 11.0, *) {
            someFuncWithAvailability()
        }
    }

    var someVariable = true

    private var someOtherVariable: Bool = false {
        didSet {
            if #available(iOS 11.0, *) {
                // build error
                someFuncWithAvailability()
            }
        }
    }

    @available(iOS 11.0, *)
    @objc func someFuncWithAvailability() {
    }


}
