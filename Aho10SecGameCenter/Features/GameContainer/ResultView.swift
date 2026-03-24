import SwiftUI

struct ResultView: View {
    let result: GameResult
    let onReplay: () -> Void
    let onBackToHome: () -> Void

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Text("結果発表")
                .font(AppTypography.title)
            Text(result.gameType.title)
                .font(AppTypography.headline)
                .multilineTextAlignment(.center)
            Text("Score: \(result.score)")
                .font(AppTypography.hero)
            Text("獲得コイン: +\(result.earnedCoins)")
                .font(AppTypography.body)
            if result.bestScoreUpdated {
                Text("ベスト更新！")
                    .font(AppTypography.headline)
                    .foregroundStyle(AppColors.success)
            }
            if let failReason = result.failReason {
                Text(failReason)
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.textSecondary)
                    .multilineTextAlignment(.center)
            }

            Button("もう一回") { onReplay() }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(AppColors.accent)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))

            Button("ゲーム選択へ戻る") { onBackToHome() }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(AppColors.card)
                .foregroundStyle(AppColors.textPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        }
        .padding(AppSpacing.lg)
        .cardStyle()
    }
}
