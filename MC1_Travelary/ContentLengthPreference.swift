//
//  ContentLengthPreference.swift
//  MC1_Travelary
//
//  Created by 유지수 on 3/26/24.
//

import SwiftUI

struct ContentLengthPreference: PreferenceKey {
    typealias Value = [Int: CGFloat]
    static var defaultValue: Value = [:]
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.merge(nextValue()) { (current, _) in current }
    }
}
