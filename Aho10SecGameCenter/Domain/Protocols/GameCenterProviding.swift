import Foundation

@MainActor
protocol GameCenterProviding {
    func authenticate() async
    func submit(score: Int, for game: GameType) async
    func updateAchievement(id: String, progress: Double) async
}
