import Foundation
import GameKit

@MainActor
final class GameCenterService: GameCenterProviding {
    func authenticate() async {
        GKLocalPlayer.local.authenticateHandler = { _, _ in }
    }

    func submit(score: Int, for game: GameType) async {
        guard GKLocalPlayer.local.isAuthenticated else { return }
        GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local, leaderboardIDs: [game.leaderboardID]) { _ in }
    }

    func updateAchievement(id: String, progress: Double) async {
        guard GKLocalPlayer.local.isAuthenticated else { return }
        let achievement = GKAchievement(identifier: id)
        achievement.percentComplete = progress
        achievement.showsCompletionBanner = true
        try? await GKAchievement.report([achievement])
    }
}
