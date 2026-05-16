//
//  CircleMenuItemView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class CircleMenuItemView: UIView {
    private var title = ""

    private let button = UIButton()
    private let titleLabel = UILabel()

    init(title: String) {
        super.init(frame: .zero)
        self.title = title
        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        button.do {
            $0.clipsToBounds = true
            $0.backgroundColor = .gray300
            $0.layer.cornerRadius = 25
        }
        
        titleLabel.do {
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.textColor = .black
            $0.attributedText = NSAttributedString(string: self.title, attributes: UIFont.caption_m_12.attributes(alignment: .center))
        }
    }

    private func setUI() {
        addSubviews(button, titleLabel)
    }

    private func setLayout() {
        button.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.size.equalTo(50)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(button.snp.bottom).offset(8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
