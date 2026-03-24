import Foundation

struct PlayerProfile: Codable, Equatable {
    var totalCoins: Int = 0
    var totalPlayCount: Int = 0
    var totalFailCount: Int = 0
    var adRemoved: Bool = false
    var unlockedSkins: [String] = []
    var settings: AppSettings = .init()
}
