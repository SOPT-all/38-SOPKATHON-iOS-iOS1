//
//  MemorySpaceCell.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/16/26.
//


import UIKit

import SnapKit
import Then

final class MemorySpaceCell: UITableViewCell {

    static let identifier = "MemorySpaceCell"

    private let containerView = UIView().then {
        $0.backgroundColor = .gray800
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 18
    }

    private let nameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }

    private let dDayLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }

    private let textStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
    }

    private let inviteButton = UIButton(type: .custom).then {
        $0.setImage(UIImage(named: "invite2"), for: .normal)
        $0.setImage(UIImage(named: "invite0"), for: .highlighted)
        $0.adjustsImageWhenHighlighted = false
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        profileImageView.image = nil
        nameLabel.text = nil
        dDayLabel.text = nil
    }

    func configure(
        profileImageName: String,
        name: String,
        dDay: String
    ) {
        profileImageView.image = UIImage(named: profileImageName)
        nameLabel.text = name
        dDayLabel.text = dDay
    }
}

private extension MemorySpaceCell {

    func setStyle() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    func setUI() {
        contentView.addSubview(containerView)

        containerView.addSubview(profileImageView)
        containerView.addSubview(textStackView)
        containerView.addSubview(inviteButton)

        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(dDayLabel)
    }

    func setLayout() {
        containerView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.leading.trailing.equalToSuperview()
        }

        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(36)
        }

        textStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(inviteButton.snp.leading).offset(-16)
        }

        inviteButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(55)
            $0.height.equalTo(35)
        }
    }
}
