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

    private let textField = UITextField()
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
            $0.backgroundColor = .yellow
            $0.layer.cornerRadius = 32
            $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            $0.clipsToBounds = true
        }

        textField.do {
            $0.font = UIFont.body_m_14.font
            $0.textColor = .black
            $0.backgroundColor = .white
            $0.layer.borderColor = UIColor.gray300?.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 8
            $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
            $0.leftViewMode = .always
            $0.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
            $0.rightViewMode = .always
            $0.attributedPlaceholder = NSAttributedString(
                string: "마지막 인사를 남겨주세요.",
                attributes: [.foregroundColor: UIColor.gray400]
            )
        }

        sendButton.do {
            $0.backgroundColor = .clear
            $0.setImage(UIImage(resource: .send), for: .normal)
            $0.tintColor = .gray600
        }
    }

    private func setUI() {
        addSubviews(textField, sendButton)
    }

    private func setLayout() {
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(27.5)
            $0.top.equalToSuperview().inset(24)
            $0.bottom.equalToSuperview().inset(37)
        }

        sendButton.snp.makeConstraints {
            $0.leading.equalTo(textField.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().inset(27.5)
            $0.centerY.equalTo(textField)
            $0.size.equalTo(24)
        }

        self.snp.makeConstraints {
            $0.height.equalTo(108)
        }
    }
}
