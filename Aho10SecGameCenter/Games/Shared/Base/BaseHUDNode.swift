import SpriteKit

final class BaseHUDNode: SKNode {
    let scoreLabel = ScoreLabelNode(text: "0")
    let reactionLabel = ReactionLabelNode()

    override init() {
        super.init()
        addChild(scoreLabel)
        addChild(reactionLabel)
    }

    func layout(in size: CGSize) {
        scoreLabel.position = CGPoint(x: 20, y: size.height - 50)
        reactionLabel.position = CGPoint(x: size.width / 2, y: size.height - 90)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
