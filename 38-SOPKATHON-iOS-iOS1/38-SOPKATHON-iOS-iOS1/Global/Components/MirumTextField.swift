//
//  MirumTextField.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/16/26.
//

import UIKit

import SnapKit

final class MirumTextField: UITextField {

    enum Size {
        case medium
        case big

        var fontStyle: FontStyle {
            switch self {
            case .medium: return UIFont.body_m_14
            case .big: return UIFont.body_m_16
            }
        }
    }

    private let size: Size

    init(size: Size = .medium) {
        self.size = size
        super.init(frame: .zero)
        setStyle()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var placeholder: String? {
        didSet {
            attributedPlaceholder = NSAttributedString(
                string: placeholder ?? "",
                attributes: [.foregroundColor: UIColor.gray500 ?? .gray]
            )
        }
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12))
    }

    private func setStyle() {
        layer.borderWidth = 1
        layer.backgroundColor = UIColor.gray600?.cgColor
        layer.borderColor = UIColor.gray500?.cgColor
        layer.cornerRadius = 8
        defaultTextAttributes = [
            .font: size.fontStyle.font,
            .kern: size.fontStyle.letterSpacing
        ]
        textColor = .white
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(37)
        }
    }
}
