import Foundation

enum GameRandomizer {
    static func randomBool() -> Bool { Bool.random() }
    static func randomCGFloat(in range: ClosedRange<Double>) -> CGFloat { CGFloat(Double.random(in: range)) }
}
