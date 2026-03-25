import Foundation

struct GameRecord: Codable, Equatable {
    let gameType: GameType
    var bestScore: Int = 0
    var playCount: Int = 0
    var failCount: Int = 0
    var totalScore: Int = 0
}
