//
//  RemembranceInfoRowView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class RemembranceInfoRowView: UIView {
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    init(title: String, value: String) {
        super.init(frame: .zero)

        titleLabel.do {
            $0.attributedText = NSAttributedString(string: title, attributes: UIFont.caption_b_12.attributes())
            $0.textColor = .black
        }
        valueLabel.do {
            $0.attributedText = NSAttributedString(string: value, attributes: UIFont.caption_m_12.attributes())
            $0.textColor = .black
        }

        addSubviews(titleLabel, valueLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        valueLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.centerY.top.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
