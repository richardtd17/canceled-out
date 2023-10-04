//
//  IntExtension.swift
//  Canceled Out Project
//
//  Created by Richard Duong on 10/1/23.
//

import Foundation

extension Int {
    var ordinal: String {
        get {
            var suffix: String
            let ones: Int = self % 10
            let tens: Int = (self/10) % 10
            if (tens == 1) {
                suffix = "th"
            } else if (ones == 1){
                suffix = "st"
            } else if (ones == 2){
                suffix = "nd"
            } else if (ones == 3){
                suffix = "rd"
            } else {
                suffix = "th"
            }
            return "\(self)\(suffix)"
        }
    }
}
