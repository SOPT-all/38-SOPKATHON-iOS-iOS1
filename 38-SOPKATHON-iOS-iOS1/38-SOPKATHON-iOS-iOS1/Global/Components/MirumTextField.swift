//
//  MirumTextField.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/16/26.
//

import UIKit

final class MirumTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        layer.cornerRadius = 8
    }
    
}
