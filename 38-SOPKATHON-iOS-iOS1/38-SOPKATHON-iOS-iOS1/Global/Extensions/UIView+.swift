//
//  UIView+.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/16/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
