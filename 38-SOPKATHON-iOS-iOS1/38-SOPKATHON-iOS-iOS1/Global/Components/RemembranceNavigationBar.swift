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
    }

    private func setUI() {
        addSubview(backButton)
    }

    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(10)
            $0.size.equalTo(24)
        }
    }

}
