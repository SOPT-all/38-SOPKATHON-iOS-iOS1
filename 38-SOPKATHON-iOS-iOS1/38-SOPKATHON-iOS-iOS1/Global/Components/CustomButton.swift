//
//  ButtonComponents.swift
//  
//
//  Created by 장지인 on 5/16/26.
//

import UIKit
import SnapKit
import Then

enum SetButtonType {
    case small
    case medium
    
    var radius: CGFloat {
        switch self {
        case .small:
            return 8
            
        case .medium:
            return 10
        }
    }
    
    var title: String {
        switch self {
        case .small:
            return "small"
            
        case .medium:
            return "medium"
        }
    }
}
final class ButtonComponents: UIButton {
    
    // MARK: - Properties
    
    private let custombuttonType: SetButtonType
    
    override var isHighlighted: Bool {
        didSet {
            if custombuttonType == .medium {
                updateOutlineColor(isPressed: isHighlighted)
            }
        }
    }
    
    // MARK: - Initializer
    
    init(type: SetButtonType, title: String? = nil) {
        self.custombuttonType = type
        super.init(frame: .zero)
        
        setButtonStyle()
        setButtonTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setButtonStyle() {
        layer.cornerRadius = custombuttonType.radius
        clipsToBounds = true
        
        switch custombuttonType {
        case .small:
            backgroundColor = .white
            titleLabel?.font = UIFont.body_r_14.font
            setTitleColor(.black, for: .normal)
            
        case .medium:
            layer.borderWidth = 1
            updateOutlineColor(isPressed: false)
            titleLabel?.font = UIFont.body_r_14.font
            setTitleColor(.black, for: .normal)
        }
    }
    
    private func setButtonTitle(_ title: String?) {
        let buttonTitle = title ?? custombuttonType.title
        setTitle(buttonTitle, for: .normal)
    }
    
    private func updateOutlineColor(isPressed: Bool) {
        layer.borderColor = isPressed
        ? UIColor.gray900?.cgColor
        : UIColor.gray50?.cgColor
    }
}
