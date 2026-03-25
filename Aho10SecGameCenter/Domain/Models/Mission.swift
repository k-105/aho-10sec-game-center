import Foundation

struct Mission: Codable, Equatable, Identifiable {
    enum ConditionType: String, Codable {
        case playCount
        case scoreTotal
    }

    let id: String
    let dateKey: String
    let title: String
    let targetGame: GameType?
    let conditionType: ConditionType
    let targetValue: Int
    let rewardCoins: Int
    var completed: Bool
}
