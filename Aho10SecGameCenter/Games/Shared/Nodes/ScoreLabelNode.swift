import SpriteKit

final class ScoreLabelNode: SKLabelNode {
    init(text: String) {
        super.init()
        self.text = text
        fontName = "AvenirNext-Bold"
        fontSize = 28
        fontColor = .black
        zPosition = 50
        horizontalAlignmentMode = .left
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
