import SpriteKit

final class StampMasterScene: BaseMiniGameScene {
    private let targetNode = StampTargetNode()
    private var elapsed: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0

    init() {
        super.init(gameType: .stampMaster)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        targetNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 20)
        addChild(targetNode)
        showReaction("紙が揺れる")
    }

    override func update(_ currentTime: TimeInterval) {
        guard !hasEnded else { return }
        let delta = lastUpdateTime == 0 ? 0 : currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        elapsed += delta
        let x = sin(elapsed * 2.5) * 85
        targetNode.paper.position.x = x
        targetNode.targetLine.position.x = x
        targetNode.stamp.position.x = x * 0.4
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !hasEnded else { return }
        let distance = abs(targetNode.targetLine.position.x)
        let score: Int
        let reaction: String
        let failReason: String?

        switch distance {
        case 0..<12:
            score = 100
            reaction = "完璧"
            failReason = nil
        case 12..<32:
            score = 70
            reaction = "いい感じ"
            failReason = nil
        case 32..<58:
            score = 40
            reaction = "セーフ"
            failReason = nil
        case 58..<88:
            score = 15
            reaction = "斜めです"
            failReason = "ハンコが少し斜めです"
        default:
            score = 0
            reaction = "これでは出せません"
            failReason = "これでは出せません"
        }

        currentScore = score
        updateScoreLabel()
        showReaction(reaction)
        endGame(score: score, failReason: failReason)
    }
}
