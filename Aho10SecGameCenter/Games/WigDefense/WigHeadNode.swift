import SpriteKit

final class WigHeadNode: SKNode {
    let head = SKShapeNode(circleOfRadius: 60)
    let wig = SKShapeNode(rectOf: CGSize(width: 110, height: 36), cornerRadius: 18)

    override init() {
        super.init()
        head.fillColor = .systemYellow
        head.strokeColor = .clear
        wig.fillColor = .systemBrown
        wig.strokeColor = .clear
        wig.position = CGPoint(x: 0, y: 55)
        addChild(head)
        addChild(wig)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
