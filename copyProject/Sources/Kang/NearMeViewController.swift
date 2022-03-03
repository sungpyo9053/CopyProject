import UIKit
import SnapKit
import Then

final class NearMeViewController: UIViewController {

    private let scrollView = UIScrollView()

    private let scrollContentView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 15
    }

    private let hotKeywordsView = NearMeHotKeywordsView()

    private let categoriesView = CategoriesView()

    override func viewDidLoad() {
        super.viewDidLoad()

        addViews()
        configureLayouts()
        setup()
    }

    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        let hotKeywordsSeperatorView = HorizontalLineView(frame: .zero, spacing: 15)
        scrollContentView.addArrangedSubview(hotKeywordsView)
        scrollContentView.addArrangedSubview(hotKeywordsSeperatorView)
        let categoriesSeperatorView = HorizontalLineView(frame: .zero, spacing: 15)
        scrollContentView.addArrangedSubview(categoriesView)
        scrollContentView.addArrangedSubview(categoriesSeperatorView)
    }

    private func configureLayouts() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        scrollContentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide.snp.edges)
            $0.width.equalTo(scrollView.frameLayoutGuide.snp.width)
            $0.height.equalTo(scrollView.frameLayoutGuide.snp.height).priority(.low)
        }
    }

    private func setup() {
        let keywords = (0..<10).map { index -> String in
            if index == .zero {
                return ""
            } else {
                return "테스트 \(index)"
            }
        }
        hotKeywordsView.setup(with: keywords)

        let categories = [
            0: [
                Category(name: "쿠폰북", image: "ticket"),
                Category(name: "알바", image: "person.3"),
                Category(name: "농수산물", image: "applelogo"),
                Category(name: "중고차", image: "car.2"),
            ],
            1: [
                Category(name: "과외/클래스", image: "pencil.tip.crop.circle.badge.arrow.forward"),
                Category(name: "부동산", image: "house.circle"),
                Category(name: "생활서비스", image: "waveform.path.ecg"),
                Category(name: "기타", image: "swift"),
            ],
        ]

        categoriesView.setup(with: categories)
    }
}
