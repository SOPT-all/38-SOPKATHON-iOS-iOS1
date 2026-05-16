//
//  dimmedView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//

import UIKit

final class DimView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        backgroundColor = UIColor.black?.withAlphaComponent(0.5)
        alpha = 1
    }
}
