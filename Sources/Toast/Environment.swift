//
//  Environment.swift
//  Toast
//
//  Created by Krisztián Kemenes on 05.10.2024.
//

import SwiftUI

public struct ShowToastEnvironmentKey: EnvironmentKey {
    nonisolated(unsafe) public static let defaultValue: (Toast) -> Void = { _ in }
}

public extension EnvironmentValues {
    var showToast: (Toast) -> Void {
        get { self[ShowToastEnvironmentKey.self] }
        set { self[ShowToastEnvironmentKey.self] = newValue }
    }
}
