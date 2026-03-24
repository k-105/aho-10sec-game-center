import SwiftUI

struct TitleView: View {
    @EnvironmentObject private var environment: AppEnvironment

    var body: some View {
        VStack(spacing: AppSpacing.lg) {
            Spacer()
            Text("アホ10秒\nゲームセンター")
                .font(AppTypography.hero)
                .multilineTextAlignment(.center)
                .foregroundStyle(AppColors.textPrimary)
            Text("くだらない事故が毎日起きる街で、\n今日も10秒だけ本気を出す。")
                .font(AppTypography.body)
                .multilineTextAlignment(.center)
                .foregroundStyle(AppColors.textSecondary)

            Button("はじめる") {
                environment.completeTitleFlow()
            }
            .font(AppTypography.headline)
            .padding(.horizontal, 36)
            .padding(.vertical, 14)
            .background(AppColors.accent)
            .foregroundStyle(.white)
            .clipShape(Capsule())

            Spacer()
            Text("1操作・5〜15秒・何度でもやり直せるミニゲーム集")
                .font(AppTypography.caption)
                .foregroundStyle(AppColors.textSecondary)
        }
        .padding(AppSpacing.xl)
    }
}
