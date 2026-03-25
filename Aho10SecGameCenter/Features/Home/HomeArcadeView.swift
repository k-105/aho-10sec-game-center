import SwiftUI

struct HomeArcadeView: View {
    @EnvironmentObject private var environment: AppEnvironment
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            VStack(spacing: AppSpacing.md) {
                header
                MissionBannerView(mission: environment.todayMission)

                LazyVGrid(columns: columns, spacing: AppSpacing.md) {
                    ForEach(GameType.allCases) { game in
                        Button {
                            if game.isAvailableInV1 {
                                environment.resetLatestResult()
                                environment.router.showGame(game)
                            }
                        } label: {
                            GameTileView(gameType: game)
                        }
                        .buttonStyle(.plain)
                        .disabled(!game.isAvailableInV1)
                    }
                }
            }
            .padding(AppSpacing.md)
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var header: some View {
        VStack(spacing: AppSpacing.md) {
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("アホ10秒ゲームセンター")
                        .font(AppTypography.title)
                    Text("今日もくだらない事故を最短で回避しよう")
                        .font(AppTypography.caption)
                        .foregroundStyle(AppColors.textSecondary)
                }
                Spacer()
                Button("設定") { environment.router.showSettings() }
                    .font(AppTypography.body)
            }

            HStack(spacing: AppSpacing.md) {
                statCard(title: "コイン", value: "\(environment.profile.totalCoins)")
                statCard(title: "総プレイ", value: "\(environment.profile.totalPlayCount)")
                statCard(title: "失敗", value: "\(environment.profile.totalFailCount)")
            }
        }
    }

    private func statCard(title: String, value: String) -> some View {
        VStack(spacing: 6) {
            Text(title).font(AppTypography.caption).foregroundStyle(AppColors.textSecondary)
            Text(value).font(AppTypography.headline)
        }
        .frame(maxWidth: .infinity)
        .cardStyle()
    }
}
