import SwiftUI

fileprivate let toastTimeInterval: TimeInterval = 5

public struct ToastWrapper: ViewModifier {
    @State private var activeToast: Toast?
    @GestureState private var dragHeight: CGFloat = 0
    private let feedbackGenerator = FeedbackGenerator()
    
    public func body(content: Content) -> some View {
        content
            .environment(\.showToast) { newToast in
                withAnimation {
                    self.activeToast = newToast
                    feedbackGenerator.generateFeedback()
                }
            }
            .onChange(of: activeToast) { newValue in
                if newValue != nil {
                    DispatchQueue.main.asyncAfter(deadline: .now() + toastTimeInterval) {
                        withAnimation {
                            self.activeToast = nil
                        }
                    }
                }
            }
            .overlay(alignment: .top) {
                if let activeToast {
                    ToastView(toast: activeToast)
                        .transition(.move(edge: .top)
                                    .combined(with: .opacity))
                        .id(activeToast.message)
                        .offset(y: dragHeight)
                        .animation(.interactiveSpring, value: dragHeight)
                        .gesture(
                            DragGesture()
                                .updating($dragHeight) { value, state, _ in
                                    state = dragMapper(value.translation.height)
                                }
                                .onEnded({ gestureValue in
                                    if gestureValue.translation.height < 0 {
                                        withAnimation {
                                            self.activeToast = nil
                                        }
                                    }
                                })
                        )
                }
            }
    }
    
    private func dragMapper(_ value: CGFloat) -> CGFloat {
        if value < 0 {
            value
        } else {
            pow(value, 2/3)
        }
    }
}

public extension View {
    func toastContainer() -> some View {
        modifier(ToastWrapper())
    }
}
