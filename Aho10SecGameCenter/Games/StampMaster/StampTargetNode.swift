import SpriteKit

final class StampTargetNode: SKNode {
    let paper = SKShapeNode(rectOf: CGSize(width: 240, height: 160), cornerRadius: 14)
    let targetLine = SKShapeNode(rectOf: CGSize(width: 10, height: 120), cornerRadius: 5)
    let stamp = SKShapeNode(rectOf: CGSize(width: 90, height: 48), cornerRadius: 10)

    override init() {
        super.init()
        paper.fillColor = .white
        paper.strokeColor = .lightGray
        targetLine.fillColor = .systemRed
        targetLine.strokeColor = .clear
        stamp.fillColor = .systemBlue
        stamp.strokeColor = .clear
        stamp.position = CGPoint(x: 0, y: 120)
        addChild(paper)
        addChild(targetLine)
        addChild(stamp)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
