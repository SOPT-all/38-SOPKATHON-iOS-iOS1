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
            $0.backgroundColor = UIColor(red: 103/255, green: 103/255, blue: 103/255, alpha: 1)
        }

        backButton.do {
            $0.setImage(UIImage(resource: .chevronLeft), for: .normal)
            $0.tintColor = .white
        }
    }

    private func setUI() {
        addSubview(backButton)
    }

    private func setLayout() {
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(6)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }
    }
}
