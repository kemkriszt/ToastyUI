//
//  FeedbackGenerator.swift
//  ToastyUI
//
//  Created by Krisztián Kemenes on 07.10.2024.
//

#if canImport(UIKit)
import UIKit
#endif

struct FeedbackGenerator {
    @MainActor
    func generateFeedback() {
#if canImport(UIKit)
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
#endif
    }
}
