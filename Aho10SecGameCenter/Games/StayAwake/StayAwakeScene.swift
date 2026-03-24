import SpriteKit

final class StayAwakeScene: BaseMiniGameScene {
    private let gaugeNode = EyelidGaugeNode()
    private let promptLabel = SKLabelNode(fontNamed: "AvenirNext-Bold")
    private var sleepiness: CGFloat = 1.0
    private var elapsed: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    private var nextPromptTime: TimeInterval = 2.8
    private var awaitingPromptTap = false
    private var promptDeadline: TimeInterval = 0

    init() {
        super.init(gameType: .stayAwake)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        super.didMove(to: view)
        gaugeNode.position = CGPoint(x: size.width / 2, y: size.height / 2 + 100)
        addChild(gaugeNode)

        promptLabel.fontSize = 26
        promptLabel.fontColor = .black
        promptLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 - 20)
        promptLabel.text = "会議に集中せよ"
        addChild(promptLabel)
    }

    override func update(_ currentTime: TimeInterval) {
        guard !hasEnded else { return }
        let delta = lastUpdateTime == 0 ? 0 : currentTime - lastUpdateTime
        lastUpdateTime = currentTime
        elapsed += delta

        sleepiness -= CGFloat(delta * 0.08)
        gaugeNode.update(level: sleepiness)

        currentScore = Int(elapsed * 10)
        updateScoreLabel()

        if !awaitingPromptTap, elapsed >= nextPromptTime {
            awaitingPromptTap = true
            promptDeadline = elapsed + 1.0
            nextPromptTime += Double.random(in: 2.5...4.0)
            promptLabel.text = "では次、あなた"
            showReaction("返事して！")
        }

        if awaitingPromptTap, elapsed > promptDeadline {
            showReaction("指名に気づけませんでした")
            endGame(score: currentScore, failReason: "指名に気づけませんでした")
        }

        if sleepiness <= 0 {
            showReaction("寝た")
            endGame(score: currentScore, failReason: "会議で完全に落ちました")
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard !hasEnded else { return }
        if awaitingPromptTap {
            awaitingPromptTap = false
            promptLabel.text = "返事できた"
            showReaction("返事できた")
            sleepiness = min(1.0, sleepiness + 0.12)
        } else {
            sleepiness = min(1.0, sleepiness + 0.08)
            promptLabel.text = "うなずきでごまかす"
        }
        gaugeNode.update(level: sleepiness)
    }
}
