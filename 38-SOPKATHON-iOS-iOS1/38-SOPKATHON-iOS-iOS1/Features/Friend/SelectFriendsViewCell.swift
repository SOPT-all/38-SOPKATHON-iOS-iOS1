//
//  SelectFriendsView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//

import UIKit

import Then
import SnapKit

final class SelectFriendsView: UITableViewCell {
    static let identifier = "SelectFriendsView"
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let checkImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        profileImageView.do {
            $0.image = UIImage(resource: .profileImg)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 24
        }
        
        nameLabel.do {
            $0.attributedText = NSAttributedString(string: "이름", attributes: UIFont.body_sb_16.attributes)
        }
        
        checkImage.do {
            $0.image = UIImage(resource: .checkbox)
        }
    }
    
    private func setUI() {
        contentView.addSubviews(profileImageView, nameLabel, checkImage)
    }
    
    private func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.size.equalTo(48)
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.top.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
        
        checkImage.snp.makeConstraints {
            $0.size.equalTo(28)
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
