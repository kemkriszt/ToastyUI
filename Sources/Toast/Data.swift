//
//  Data.swift
//  Toast
//
//  Created by Krisztián Kemenes on 05.10.2024.
//

import SwiftUI

public enum ToastType {
    case info
    case warning
    case error
    
    var icon: Image? {
        switch self {
        case .error:
            Image(systemName: "exclamationmark.octagon")
        case .warning:
            Image(systemName: "exclamationmark.triangle")
        default:
            nil
        }
    }
    
    var foregroundColor: Color {
        switch self {
        case .error:
            .red
        case .warning:
            .orange
        default: .primary
        }
    }
}

public struct Toast: Equatable, ExpressibleByStringLiteral {
    let message: String
    var icon: Image? = nil
    var type: ToastType = .info
    
    public init(icon: Image, message: String) {
        self.message = message
        self.icon = icon
    }
    
    public init(type: ToastType = .info, message: String) {
        self.message = message
        self.type = type
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(message: value)
    }
    
    public static func == (lhs: Toast, rhs: Toast) -> Bool {
        return lhs.message == rhs.message && lhs.icon == rhs.icon
    }
}
