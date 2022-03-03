import UIKit
import SnapKit
import Then

final class CategoryView: UIView {

    private enum Metric {

        static let iconWidth: CGFloat = 25
    }

    private let iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .systemGray2
    }

    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .label
        $0.textAlignment = .center
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        configureLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("CategoryView has not been implemented")
    }

    private func addViews() {
        addSubview(iconImageView)
        addSubview(nameLabel)
    }

    private func configureLayouts() {
        iconImageView.snp.makeConstraints {
            $0.top.equalTo(15)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(CGSize(width: Metric.iconWidth, height: Metric.iconWidth))
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(-15)
        }
    }

    func setup(with category: Category) {
        nameLabel.text = category.name
        iconImageView.image = UIImage(systemName: category.image)
    }
}
