import SwiftUI

struct AppRootView: View {
    @EnvironmentObject private var environment: AppEnvironment

    var body: some View {
        NavigationStack {
            Group {
                switch environment.router.route {
                case .title:
                    TitleView()
                case .home:
                    HomeArcadeView()
                case .game(let gameType):
                    MiniGameContainerView(gameType: gameType)
                case .settings:
                    SettingsView()
                case .achievements:
                    AchievementListView()
                case .shop:
                    ShopView()
                }
            }
            .background(AppColors.background.ignoresSafeArea())
        }
    }
}
