import SpriteKit

final class EyelidGaugeNode: SKNode {
    private let backgroundBar = SKShapeNode(rectOf: CGSize(width: 220, height: 24), cornerRadius: 12)
    private let fillBar = SKShapeNode(rectOf: CGSize(width: 216, height: 18), cornerRadius: 9)

    override init() {
        super.init()
        backgroundBar.fillColor = .darkGray
        backgroundBar.strokeColor = .clear
        fillBar.fillColor = .systemGreen
        fillBar.strokeColor = .clear
        addChild(backgroundBar)
        addChild(fillBar)
    }

    func update(level: CGFloat) {
        fillBar.xScale = max(0.02, level)
        fillBar.fillColor = level > 0.4 ? .systemGreen : .systemOrange
        if level < 0.2 {
            fillBar.fillColor = .systemRed
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
