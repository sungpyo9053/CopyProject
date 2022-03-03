//
//  HotKeywordCollectionCell.swift
//  copyProject
//
//  Created by enne on 2022/02/24.
//

import UIKit

final class HotKeywordCollectionCell: UICollectionViewCell {

    enum Reuse {

        static let identifier = "HotKeywordCollectionCell"
    }

    private lazy var button = RoundedButton().then {
        $0.titleLabel?.font = .boldSystemFont(ofSize: 12)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        configureLayouts()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("HotKeywordCollectionCell has not been implemented")
    }

    private func addViews() {
        addSubview(button)
    }

    private func configureLayouts() {
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func setup(with keyword: String = "") {
        if keyword.isEmpty {
            button.setTitle("인기", for: .normal)
            button.setTitleColor(.systemGray2, for: .normal)
            button.borderWidth = 0
            button.radiusRatio = 0
        } else {
            button.setTitle(keyword, for: .normal)
            button.setTitleColor(.label, for: .normal)
            button.borderColor = .systemGray5
            button.borderWidth = 1.0
            button.radiusRatio = frame.height / 2
        }
    }
}
