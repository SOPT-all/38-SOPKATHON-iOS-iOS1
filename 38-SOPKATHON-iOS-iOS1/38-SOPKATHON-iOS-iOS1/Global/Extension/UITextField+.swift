//
//  UITextField+.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/16/26.
//

import UIKit

extension UITextField {
    func setLeftPadding(_ amount: CGFloat) {
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.height))
        leftViewMode = .always
    }
}
