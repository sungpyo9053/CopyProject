import UIKit
import SnapKit
import Then

final class NearMeHotKeywordsView: UIView {

    private enum Metric {

        static let itemSize = CGSize(width: 60, height: 34)
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.itemSize = Metric.itemSize
            $0.headerReferenceSize = .zero
            $0.footerReferenceSize = .zero
            $0.scrollDirection = .horizontal
            $0.minimumInteritemSpacing = 8
        }

        return UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.collectionViewLayout = layout
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .systemBackground
            $0.contentInset = .init(top: 0, left: 0, bottom: 0, right: 15)
            $0.delegate = self
            $0.dataSource = self
            $0.register(
                HotKeywordCollectionCell.self,
                forCellWithReuseIdentifier: HotKeywordCollectionCell.Reuse.identifier
            )
        }
    }()

    private var keywords: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        configureLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("NearMeHotKeywordsView has not been implemented")
    }
    
    private func addViews() {
        addSubview(collectionView)
    }
    
    private func configureLayouts() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(Metric.itemSize.height)
        }
    }

    func setup(with keywords: [String]) {
        self.keywords = keywords
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension NearMeHotKeywordsView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keywords.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotKeywordCollectionCell.Reuse.identifier, for: indexPath) as? HotKeywordCollectionCell else {
          return UICollectionViewCell()
        }
        if indexPath.row == .zero {
            cell.setup()
        } else {
            cell.setup(with: keywords[indexPath.row])
        }
        return cell
    }
}
