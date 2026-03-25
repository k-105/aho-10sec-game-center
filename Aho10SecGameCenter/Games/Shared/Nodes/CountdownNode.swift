import SpriteKit

final class CountdownNode: SKLabelNode {
    override init() {
        super.init()
        fontName = "AvenirNext-Bold"
        fontSize = 18
        fontColor = .darkGray
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
