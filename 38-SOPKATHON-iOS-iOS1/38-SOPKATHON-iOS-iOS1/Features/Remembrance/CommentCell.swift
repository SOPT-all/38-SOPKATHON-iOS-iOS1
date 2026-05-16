//
//  CommentCell.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/16/26.
//

import UIKit

import SnapKit
import Then

final class CommentCell: UIView {
    private var name = ""
    private var message = ""
    private var time = ""
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let commentLabel = UILabel()
    private let timeLabel = UILabel()
    
    init(name: String, message: String, time: String) {
        super.init(frame: .zero)
        
        self.name = name
        self.message = message
        self.time = time
        
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
            $0.attributedText = NSAttributedString(string: self.name, attributes: UIFont.body_sb_16.attributes)
        }
        
        commentLabel.do {
            $0.attributedText = NSAttributedString(string: self.message, attributes: UIFont.body_r_14.attributes)
        }
        
        timeLabel.do {
            $0.attributedText = NSAttributedString(string: self.time, attributes: UIFont.body_r_14.attributes)
        }
    }
    
    private func setUI() {
        addSubviews(profileImageView, nameLabel, commentLabel, timeLabel)
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
        }
        
        commentLabel.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.top.equalTo(nameLabel.snp.bottom)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        timeLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
