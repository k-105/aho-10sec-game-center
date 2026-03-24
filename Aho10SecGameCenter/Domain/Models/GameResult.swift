import Foundation

struct GameResult: Codable, Equatable {
    let gameType: GameType
    let score: Int
    let bestScoreUpdated: Bool
    let earnedCoins: Int
    let missionCompleted: Bool
    let failReason: String?
}
