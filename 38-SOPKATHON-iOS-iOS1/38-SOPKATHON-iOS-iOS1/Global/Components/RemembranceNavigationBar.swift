//
//  RemembranceNavigationBar.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class RemembranceNavigationBar: UIView {

    let backButton = UIButton()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        self.do {
            $0.backgroundColor = UIColor.yellow
        }

        backButton.do {
            $0.setImage(UIImage(resource: .icBack), for: .normal)
        }

        titleLabel.do {
            $0.attributedText = NSAttributedString(string: "미룸 장례식", attributes: UIFont.title_b_18.attributes(alignment: .center))
            $0.textColor = .gray600
        }
    }

    private func setUI() {
        addSubviews(backButton, titleLabel)
    }

    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
            $0.bottom.equalToSuperview().inset(10)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }

}
