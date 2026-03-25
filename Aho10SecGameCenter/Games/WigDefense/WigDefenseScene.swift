import SpriteKit

final class WigDefenseScene: BaseMiniGameScene {
    private let headNode = WigHeadNode()
    private var isHolding = false
    private var wigOffset: CGFloat = 0
    private var elapsed: TimeInterval = 0
    private var neckStrain: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0

    init() {
        super.init(gameType: .wigDefense)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        headNode.position = CGPoint(x: size.width / 2, y: size.height / 2 - 30)
        addChild(headNode)
        showReaction("耐えろ")
    }

    override func update(_ currentTime: TimeInterval) {
        guard !hasEnded else { return }
        let delta = lastUpdateTime == 0 ? 0 : currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        elapsed += delta

        let wind = sin(elapsed * 3.2) * 1.7 + cos(elapsed * 2.1) * 0.8
        wigOffset += CGFloat(wind) * (isHolding ? 0.7 : 2.6)
        wigOffset = GameMath.clamped(wigOffset, min: -120, max: 120)
        headNode.wig.position.x = wigOffset

        if isHolding {
            neckStrain += delta
        } else {
            neckStrain = max(0, neckStrain - delta * 0.8)
        }

        currentScore = Int(elapsed * 10)
        updateScoreLabel()

        if abs(wigOffset) > 100 {
            showReaction("飛んだ")
            endGame(score: currentScore, failReason: "今日は風が強い")
        } else if neckStrain > 4.5 {
            showReaction("首が変な角度になった")
            endGame(score: currentScore, failReason: "押さえすぎで首が変な角度になった")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHolding = true
        showReaction("耐えろ")
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHolding = false
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHolding = false
    }
}
