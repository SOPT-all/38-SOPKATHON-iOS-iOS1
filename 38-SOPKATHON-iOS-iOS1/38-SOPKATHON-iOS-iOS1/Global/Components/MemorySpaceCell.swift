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

    // MARK: - Identifier

    static let identifier = "MemorySpaceCell"

    // MARK: - UI

    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .gray300
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 32
    }

    private let nameLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }

    private let goalLabel = UILabel().then {
        $0.textColor = .gray500
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
    }

    private let textStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 4
        $0.alignment = .leading
        $0.distribution = .fill
    }

    private let enterButton = UIButton(type: .system).then {
        $0.setTitle("초대", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()

        profileImageView.image = nil
        nameLabel.text = nil
        goalLabel.text = nil
    }

    // MARK: - Configure

    func configure(
        profileImageName: String,
        name: String,
        goalCount: Int
    ) {
        profileImageView.image = UIImage(named: profileImageName)
        nameLabel.text = name
        goalLabel.text = "목표 • \(goalCount)명"
    }
}

private extension MemorySpaceCell {

    func setStyle() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        selectionStyle = .none
    }

    func setUI() {
        contentView.addSubview(profileImageView)
        contentView.addSubview(textStackView)
        contentView.addSubview(enterButton)

        textStackView.addArrangedSubview(nameLabel)
        textStackView.addArrangedSubview(goalLabel)
    }

    func setLayout() {
        profileImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(64)
        }

        textStackView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(32)
            $0.centerY.equalToSuperview()
            $0.trailing.lessThanOrEqualTo(enterButton.snp.leading).offset(-16)
        }

        enterButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(55)
            $0.height.equalTo(35)
        }
    }
}
