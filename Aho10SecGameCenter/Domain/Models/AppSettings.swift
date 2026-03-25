import Foundation

struct AppSettings: Codable, Equatable {
    var soundEnabled: Bool = true
    var hapticsEnabled: Bool = true
    var tutorialShown: Bool = false
}
