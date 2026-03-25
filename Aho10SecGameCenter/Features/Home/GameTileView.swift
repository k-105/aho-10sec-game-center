import SwiftUI

struct GameTileView: View {
    let gameType: GameType

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(gameType.isAvailableInV1 ? "PLAY" : "LOCK")
                .font(AppTypography.caption)
                .foregroundStyle(gameType.isAvailableInV1 ? AppColors.accentSecondary : AppColors.textSecondary)
            Spacer()
            Text(gameType.title)
                .font(AppTypography.headline)
                .foregroundStyle(AppColors.textPrimary)
                .multilineTextAlignment(.leading)
            Text(gameType.isAvailableInV1 ? "10秒で笑える事故発生中" : "今後追加予定")
                .font(AppTypography.caption)
                .foregroundStyle(AppColors.textSecondary)
        }
        .frame(maxWidth: .infinity, minHeight: 130, alignment: .leading)
        .padding(AppSpacing.md)
        .background(gameType.isAvailableInV1 ? AppColors.card : AppColors.locked.opacity(0.55))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
    }
}
