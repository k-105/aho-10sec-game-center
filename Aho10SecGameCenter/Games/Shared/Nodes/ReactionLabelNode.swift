import SpriteKit

final class ReactionLabelNode: SKLabelNode {
    init(text: String = "") {
        super.init()
        self.text = text
        fontName = "AvenirNext-Heavy"
        fontSize = 24
        fontColor = .black
        zPosition = 50
        alpha = 0
    }

    func flash(text: String) {
        self.text = text
        removeAllActions()
        run(.sequence([
            .fadeAlpha(to: 1, duration: 0.1),
            .wait(forDuration: 0.45),
            .fadeOut(withDuration: 0.2)
        ]))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
