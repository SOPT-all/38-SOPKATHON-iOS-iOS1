//
//  GoalCheckCell.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class GoalCheckCell: UITableViewCell {

    static let identifier = "GoalCheckCell"

    enum CheckStyle {
        case yellowNo
        case yellowYes

        var checkedImageName: String {
            switch self {
            case .yellowNo:
                return "yellowCheckNo"
            case .yellowYes:
                return "yellowCheckYes"
            }
        }
    }

    var checkButtonDidTap: (() -> Void)?
    var inviteButtonDidTap: (() -> Void)?

    private let containerView = UIView().then {
        $0.backgroundColor = .gray800
        $0.layer.cornerRadius = 7
        $0.clipsToBounds = true
    }

    private let checkButton = UIButton(type: .custom)

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
        $0.adjustsImageWhenHighlighted = false
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setStyle()
        setUI()
        setLayout()
        setAction()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        nameLabel.text = nil
        dDayLabel.text = nil
        checkButtonDidTap = nil
        inviteButton.setImage(UIImage(named: "invite2"), for: .normal)
        inviteButton.setImage(nil, for: .highlighted)
    }

    func configure(
        name: String,
        dDay: Int,
        checkStyle: CheckStyle,
        inviteHighlightedImageName: String
    ) {
        nameLabel.text = name
        dDayLabel.text = "D-\(dDay)"

        checkButton.setImage(
            UIImage(named: checkStyle.checkedImageName),
            for: .normal
        )

        inviteButton.setImage(UIImage(named: "invite2"), for: .normal)
        inviteButton.setImage(UIImage(named: inviteHighlightedImageName), for: .highlighted)
    }
}

private extension GoalCheckCell {

    func setStyle() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }

    func setUI() {
        contentView.addSubview(containerView)

        containerView.addSubview(checkButton)
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

        checkButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(18)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(18)
        }

        textStackView.snp.makeConstraints {
            $0.leading.equalTo(checkButton.snp.trailing).offset(18)
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

    func setAction() {
        checkButton.addTarget(
            self,
            action: #selector(checkButtonTapped),
            for: .touchUpInside
        )
        inviteButton.addTarget(
            self,
            action: #selector(inviteButtonTapped),
            for: .touchUpInside
        )
    }

    @objc
    func checkButtonTapped() {
        checkButtonDidTap?()
    }
    @objc
    func inviteButtonTapped() {
        inviteButtonDidTap?()
    }
}
