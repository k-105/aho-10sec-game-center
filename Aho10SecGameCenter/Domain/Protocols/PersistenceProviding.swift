import Foundation

protocol PersistenceProviding {
    func loadProfile() -> PlayerProfile
    func save(profile: PlayerProfile)
    func loadRecords() -> [GameType: GameRecord]
    func save(records: [GameType: GameRecord])
    func loadAchievements() -> [AchievementItem]
    func save(achievements: [AchievementItem])
}
