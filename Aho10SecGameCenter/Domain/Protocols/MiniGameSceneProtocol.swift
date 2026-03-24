import Foundation

protocol MiniGameSceneProtocol: AnyObject {
    var gameType: GameType { get }
    var onFinish: ((GameResult) -> Void)? { get set }
}
