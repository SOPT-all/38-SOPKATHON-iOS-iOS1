//
//  CommentInputView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class CommentInputView: UIView {

    private let textField = MirumTextField()
    private let sendButton = UIButton()

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
            $0.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
            $0.layer.cornerRadius = 12
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }

        textField.do {
            $0.backgroundColor = .white
            $0.font = UIFont.body_m_16.font
            $0.placeholder = "댓글을 입력해 주세요"
            $0.setLeftPadding(12)
        }

        sendButton.do {
            $0.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
            $0.layer.cornerRadius = 22
            $0.setImage(UIImage(resource: .send), for: .normal)
            $0.tintColor = .white
        }
    }

    private func setUI() {
        addSubviews(textField, sendButton)
    }

    private func setLayout() {
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(44)
            $0.width.equalTo(280)
        }

        sendButton.snp.makeConstraints {
            $0.leading.equalTo(textField.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(44)
        }

        self.snp.makeConstraints {
            $0.height.equalTo(76)
        }
    }
}
