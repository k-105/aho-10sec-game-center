import Foundation

final class AppRouter: ObservableObject {
    enum Route: Equatable {
        case title
        case home
        case game(GameType)
        case settings
        case achievements
        case shop
    }

    @Published var route: Route = .title

    func showHome() { route = .home }
    func showTitle() { route = .title }
    func showGame(_ game: GameType) { route = .game(game) }
    func showSettings() { route = .settings }
    func showAchievements() { route = .achievements }
    func showShop() { route = .shop }
}
