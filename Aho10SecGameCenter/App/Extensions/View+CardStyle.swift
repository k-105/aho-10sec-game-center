import SwiftUI

extension View {
    func cardStyle() -> some View {
        self
            .padding(AppSpacing.md)
            .background(AppColors.card)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }
}
