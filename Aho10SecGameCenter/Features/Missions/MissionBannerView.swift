import SwiftUI

struct MissionBannerView: View {
    let mission: Mission

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text("日替わりミッション")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
                Text(mission.title)
                    .font(AppTypography.headline)
                Text("報酬: \(mission.rewardCoins)コイン")
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.textSecondary)
            }
            Spacer()
            Text(mission.completed ? "達成" : "挑戦中")
                .font(AppTypography.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(mission.completed ? AppColors.success : AppColors.warning)
                .foregroundStyle(.white)
                .clipShape(Capsule())
        }
        .cardStyle()
    }
}
