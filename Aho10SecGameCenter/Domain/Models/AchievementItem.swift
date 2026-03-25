import Foundation

struct AchievementItem: Codable, Equatable, Identifiable {
    let id: String
    let title: String
    let description: String
    var unlocked: Bool
    var progress: Double
}
