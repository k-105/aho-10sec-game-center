import Foundation

enum GameType: String, CaseIterable, Codable, Identifiable, Hashable {
    case wigDefense
    case stampMaster
    case stayAwake
    case somenPicker
    case puddingCarry
    case sneezeHold
    case glassesBalance
    case elevatorClose
    case bagOpen
    case gumBubble

    var id: String { rawValue }

    var title: String {
        switch self {
        case .wigDefense: return "風速99mでヅラを守れ"
        case .stampMaster: return "ハンコを真っ直ぐ押せ"
        case .stayAwake: return "会議中に寝るな"
        case .somenPicker: return "そうめん1本だけ取れ"
        case .puddingCarry: return "プリンを倒さず運べ"
        case .sneezeHold: return "くしゃみを我慢しろ"
        case .glassesBalance: return "鼻メガネ落とすな"
        case .elevatorClose: return "エレベーター閉まれ"
        case .bagOpen: return "レジ袋を一発で開け"
        case .gumBubble: return "風船ガム割るな"
        }
    }

    var isAvailableInV1: Bool {
        switch self {
        case .wigDefense, .stampMaster, .stayAwake:
            return true
        default:
            return false
        }
    }

    var leaderboardID: String {
        switch self {
        case .wigDefense: return "wig_defense_leaderboard"
        case .stampMaster: return "stamp_master_leaderboard"
        case .stayAwake: return "stay_awake_leaderboard"
        default: return "coming_soon_leaderboard"
        }
    }
}
