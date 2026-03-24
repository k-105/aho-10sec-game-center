import Foundation

final class LocalPersistenceService: PersistenceProviding {
    private let defaults: UserDefaults
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    func loadProfile() -> PlayerProfile {
        guard let data = defaults.data(forKey: StorageKeys.profile),
              let profile = try? decoder.decode(PlayerProfile.self, from: data) else {
            return PlayerProfile()
        }
        return profile
    }

    func save(profile: PlayerProfile) {
        defaults.set(try? encoder.encode(profile), forKey: StorageKeys.profile)
    }

    func loadRecords() -> [GameType: GameRecord] {
        guard let data = defaults.data(forKey: StorageKeys.records),
              let records = try? decoder.decode([GameType: GameRecord].self, from: data) else {
            return Dictionary(uniqueKeysWithValues: GameType.allCases.map { ($0, GameRecord(gameType: $0)) })
        }
        return records
    }

    func save(records: [GameType: GameRecord]) {
        defaults.set(try? encoder.encode(records), forKey: StorageKeys.records)
    }

    func loadAchievements() -> [AchievementItem] {
        guard let data = defaults.data(forKey: StorageKeys.achievements),
              let achievements = try? decoder.decode([AchievementItem].self, from: data) else {
            return [
                AchievementItem(id: "first_play", title: "初出勤", description: "どれか1回プレイ", unlocked: false, progress: 0),
                AchievementItem(id: "wind_master", title: "風に勝った", description: "ヅラ防衛で10秒耐える", unlocked: false, progress: 0),
                AchievementItem(id: "meeting_survivor", title: "会議の覇者", description: "会議で15秒生き残る", unlocked: false, progress: 0)
            ]
        }
        return achievements
    }

    func save(achievements: [AchievementItem]) {
        defaults.set(try? encoder.encode(achievements), forKey: StorageKeys.achievements)
    }
}
