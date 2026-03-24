import Foundation

struct DailyMissionService {
    func makeTodayMission(now: Date = .now) -> Mission {
        Mission(
            id: "daily-\(now.missionDateKey)",
            dateKey: now.missionDateKey,
            title: "今日はどれでも3回遊ぼう",
            targetGame: nil,
            conditionType: .playCount,
            targetValue: 3,
            rewardCoins: 100,
            completed: false
        )
    }

    func isMissionCompleted(profile: PlayerProfile, mission: Mission) -> Bool {
        switch mission.conditionType {
        case .playCount:
            return profile.totalPlayCount >= mission.targetValue
        case .scoreTotal:
            return profile.totalCoins >= mission.targetValue
        }
    }
}
