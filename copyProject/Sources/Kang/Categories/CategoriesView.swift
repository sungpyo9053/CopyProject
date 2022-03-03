import UIKit

final class CategoriesView: UIView {

    private enum Metric {

        static let height: CGFloat = 80
    }

    private let containerStackViewView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
    }

    private var categories: [Int: [Category]] = [: ] {
        didSet {
            removeAllViews()
            setupViews()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        configureLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("CategoriesView has not been implemented")
    }

    private func addViews() {
        addSubview(containerStackViewView)
    }

    private func configureLayouts() {
        containerStackViewView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
        }
    }

    func setup(with categories: [Int: [Category]]) {
        self.categories = categories
    }

    private func removeAllViews() {
        containerStackViewView.subviews.forEach {
            containerStackViewView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }

    private func setupViews() {
        containerStackViewView.snp.remakeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(15)
            $0.trailing.equalTo(-15)
            $0.height.equalTo((CGFloat(categories.count) * Metric.height))
        }

        categories.forEach { (key, values) in
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fillEqually
            containerStackViewView.addArrangedSubview(stackView)
            setupSubViews(values, in: stackView)
        }
    }

    private func setupSubViews(_ categories: [Category], in stackView: UIStackView) {
        categories.forEach {
            let view = CategoryView()
            view.setup(with: $0)
            stackView.addArrangedSubview(view)
        }
    }
}
