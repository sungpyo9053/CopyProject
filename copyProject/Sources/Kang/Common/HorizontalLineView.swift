import UIKit

final class HorizontalLineView: UIView {

    private var spacing: CGFloat = 0

    init(frame: CGRect, spacing: CGFloat) {
        super.init(frame: frame)

        self.spacing = spacing

        addViews()
        configureLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("HorizontalLineView has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor.systemGray2.set()
        path.move(to: CGPoint(x: spacing, y: 0))
        path.addLine(to: CGPoint(x: UIScreen.main.bounds.width - spacing, y: 0))
        path.lineWidth = 0.5
        path.close()
        path.stroke()
    }

    private func addViews() {
        backgroundColor = .systemBackground
    }

    private func configureLayouts() {
        snp.makeConstraints {
            $0.height.equalTo(5)
        }
    }
}
