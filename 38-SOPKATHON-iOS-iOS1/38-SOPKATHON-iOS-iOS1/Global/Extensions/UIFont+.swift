//
//  UIFont+.swift
//
//
//  Created by 성환 on 5/16/26.
//

import UIKit

struct FontStyle {
    let font: UIFont
    let lineHeight: CGFloat
    let letterSpacing: CGFloat

    var attributes: [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.minimumLineHeight = lineHeight
        paragraphStyle.maximumLineHeight = lineHeight
        return [
            .font: font,
            .kern: letterSpacing,
            .paragraphStyle: paragraphStyle,
            .baselineOffset: (lineHeight - font.lineHeight) / 4
        ]
    }
}

extension UIFont {
    static func pretendard(size fontSize: CGFloat, weight: UIFont.Weight, lineHeightPercent: CGFloat, letterSpacingPercent: CGFloat) -> FontStyle {
        let familyName = "Pretendard"

        var weightString: String
        switch weight {
        case .black:
            weightString = "Black"
        case .bold:
            weightString = "Bold"
        case .heavy:
            weightString = "ExtraBold"
        case .ultraLight:
            weightString = "ExtraLight"
        case .light:
            weightString = "Light"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .semibold:
            weightString = "SemiBold"
        case .thin:
            weightString = "Thin"
        default:
            weightString = "Regular"
        }

        let font = UIFont(name: "\(familyName)-\(weightString)", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize, weight: weight)
        let lineHeight = fontSize * lineHeightPercent / 100
        let letterSpacing = fontSize * letterSpacingPercent / 100
        return FontStyle(font: font, lineHeight: lineHeight, letterSpacing: letterSpacing)
    }

    static let display_b_28 = UIFont.pretendard(size: 28, weight: .bold, lineHeightPercent: 130, letterSpacingPercent: -1)
    static let display_b_26 = UIFont.pretendard(size: 26, weight: .bold, lineHeightPercent: 130, letterSpacingPercent: -1)
    static let title_b_24 = UIFont.pretendard(size: 24, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let title_b_22 = UIFont.pretendard(size: 22, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let title_b_20 = UIFont.pretendard(size: 20, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let title_b_18 = UIFont.pretendard(size: 18, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let body_sb_16 = UIFont.pretendard(size: 16, weight: .semibold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let body_m_16 = UIFont.pretendard(size: 16, weight: .medium, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let body_b_14 = UIFont.pretendard(size: 14, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let body_m_14 = UIFont.pretendard(size: 14, weight: .medium, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let body_r_14 = UIFont.pretendard(size: 14, weight: .regular, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let caption_b_12 = UIFont.pretendard(size: 12, weight: .bold, lineHeightPercent: 150, letterSpacingPercent: -1)
    static let caption_m_12 = UIFont.pretendard(size: 12, weight: .medium, lineHeightPercent: 150, letterSpacingPercent: -1)
}
