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
            $0.attributedText = NSAttributedString(string: title, attributes: UIFont.body_b_14.attributes())
            $0.textColor = .white
        }
        valueLabel.do {
            $0.attributedText = NSAttributedString(string: value, attributes: UIFont.body_r_14.attributes())
            $0.textColor = .white
        }

        addSubviews(titleLabel, valueLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.equalTo(60)
        }
        valueLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(12)
            $0.trailing.equalToSuperview()
            $0.centerY.top.bottom.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateValue(_ value: String) {
        valueLabel.attributedText = NSAttributedString(string: value, attributes: UIFont.body_r_14.attributes())
    }
}
