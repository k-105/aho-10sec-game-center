import SpriteKit

class BaseMiniGameScene: SKScene, MiniGameSceneProtocol {
    let gameType: GameType
    var onFinish: ((GameResult) -> Void)?
    var currentScore: Int = 0
    var hasEnded = false
    let hud = BaseHUDNode()

    var scoreLabel: ScoreLabelNode { hud.scoreLabel }
    var reactionLabel: ReactionLabelNode { hud.reactionLabel }

    init(gameType: GameType, size: CGSize = CGSize(width: 390, height: 780)) {
        self.gameType = gameType
        super.init(size: size)
        scaleMode = .resizeFill
        backgroundColor = UIColor(red: 0.95, green: 0.97, blue: 1.0, alpha: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        setupHUD()
    }

    func setupHUD() {
        if hud.parent == nil {
            addChild(hud)
        }
        hud.layout(in: size)
        updateScoreLabel()
    }

    func updateScoreLabel() {
        scoreLabel.text = "Score: \(currentScore)"
    }

    func showReaction(_ text: String) {
        reactionLabel.flash(text: text)
    }

    func endGame(score: Int, failReason: String?) {
        guard !hasEnded else { return }
        hasEnded = true
        currentScore = score
        updateScoreLabel()

        let earnedCoins = max(10, score * 3)
        let result = GameResult(
            gameType: gameType,
            score: score,
            bestScoreUpdated: false,
            earnedCoins: earnedCoins,
            missionCompleted: false,
            failReason: failReason
        )
        onFinish?(result)
    }
}
