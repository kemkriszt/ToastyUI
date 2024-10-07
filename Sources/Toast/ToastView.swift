//
//  ToastView.swift
//  Toast
//
//  Created by Krisztián Kemenes on 05.10.2024.
//

import SwiftUI

struct ToastView: View {
    let toast: Toast
    
    var body: some View {
        HStack {
            if let icon = toast.type.icon ?? toast.icon {
                icon
                    .foregroundStyle(toast.type.foregroundColor)
                    .font(.title2)
            }
            Text(toast.message)
        }
        .font(.callout)
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.1),radius: 10, y: 8)
    }
}

#Preview {
    VStack(spacing: 20) {
        ToastView(toast: .init(message: "Hello"))
        ToastView(toast: .init(icon: .init(systemName: "car"),
                               message: "Car"))
        ToastView(toast: .init(type: .warning,
                               message: "Warning"))
        ToastView(toast: .init(type: .error,
                               message: "Error"))
    }
    .padding()
    .frame(maxWidth: .infinity, maxHeight: .infinity)
}
