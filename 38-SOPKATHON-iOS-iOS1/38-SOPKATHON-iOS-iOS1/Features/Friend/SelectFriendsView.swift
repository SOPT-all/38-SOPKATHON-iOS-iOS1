//
//  SelectFriendsView.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//
import UIKit

import SnapKit
import Then

final class SelectFriendsView: UIView {
    
    // MARK: - UI Components
    
    private let modalView = UIView()
    
    let tableView = UITableView()
    
    private let titleLabel = UILabel()
    private let titleView = UIView()
    let inviteButton = ButtonComponents(type: .small, title: "초대하기")

    let closeButton = UIButton()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    private func setStyle() {
        backgroundColor = .clear
        
        modalView.do {
            $0.backgroundColor = .gray700
            $0.layer.cornerRadius = 24
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.text = "조문객 초대하기"
            $0.font = UIFont.title_b_18.font
            $0.textAlignment = .center
            $0.textColor = .gray600
        }
        
        titleView.do {
            $0.backgroundColor = .yellow
        }
        
        tableView.do {
            $0.separatorStyle = .none
            $0.rowHeight = 48
            $0.backgroundColor = .gray700
        }
        
        inviteButton.do {
            $0.backgroundColor = .white
        }
        
        closeButton.do {
            $0.setImage(UIImage(resource: .icClose), for: .normal)
        }
    }
    
    private func setUI() {
        addSubviews(
            modalView
        )
        titleView.addSubview(titleLabel)
        
        modalView.addSubviews(
            titleView,
            tableView,
            inviteButton,
            closeButton
        )
    }

    private func setLayout() {
        modalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(64)
            $0.horizontalEdges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(28)
            $0.horizontalEdges.bottom.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(108)
        }
        
        inviteButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(16)
            $0.height.equalTo(48)
            $0.width.equalTo(311)
            $0.centerX.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(24)
            $0.size.equalTo(24)
        }
        
    }
}
