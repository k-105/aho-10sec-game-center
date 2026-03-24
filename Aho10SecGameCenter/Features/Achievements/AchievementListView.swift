import SwiftUI

struct AchievementListView: View {
    @EnvironmentObject private var environment: AppEnvironment

    var body: some View {
        VStack(spacing: AppSpacing.md) {
            Text("実績")
                .font(AppTypography.title)
            List(environment.achievements) { achievement in
                VStack(alignment: .leading, spacing: 6) {
                    Text(achievement.title).font(AppTypography.headline)
                    Text(achievement.description).font(AppTypography.caption)
                    ProgressView(value: achievement.progress)
                }
            }
            Button("戻る") { environment.router.showHome() }
        }
        .padding(AppSpacing.md)
    }
}
