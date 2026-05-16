//
//  RemembranceViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 성환 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class RemembranceViewController: UIViewController {

    // MARK: - ScrollView
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // MARK: - Card
    private let cardView = UIView()
    private let memorialImageView = UIImageView()
    private let nameLabel = UILabel()
    private let divider1 = UIView()
    private let causeOfDeathTitleLabel = UILabel()
    private let causeOfDeathLabel = UILabel()
    private let divider2 = UIView()
    private let issueNumberRow = RemembranceInfoRowView(title: "발급 번호", value: "M-124214")
    private let deathDateRow = RemembranceInfoRowView(title: "사망일", value: "2026.05.16")

    // MARK: - Menu
    private let menuStackView = UIStackView()

    // MARK: - Navigation
    private let navigationBar = RemembranceNavigationBar()

    // MARK: - Comment
    private let commentTitleLabel = UILabel()
    private let commentStackView = UIStackView()
    private let commentInputView = CommentInputView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setStyle()
        setUI()
        setLayout()
    }

    private func setStyle() {
        cardView.do {
            $0.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
            $0.layer.cornerRadius = 16
        }

        memorialImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(resource: .remembrance)
            $0.tintColor = .gray
        }

        nameLabel.do {
            $0.attributedText = NSAttributedString(string: "(고) 다이어트", attributes: UIFont.title_b_20.attributes(alignment: .center))
            $0.textColor = .black
        }

        divider1.do { $0.backgroundColor = UIColor(white: 0, alpha: 0.2) }
        divider2.do { $0.backgroundColor = UIColor(white: 0, alpha: 0.2) }

        causeOfDeathTitleLabel.do {
            $0.attributedText = NSAttributedString(string: "사망 원인", attributes: UIFont.body_b_14.attributes(alignment: .center))
            $0.textColor = .black
        }

        causeOfDeathLabel.do {
            $0.attributedText = NSAttributedString(string: "너무 많이 먹어서", attributes: UIFont.body_r_14.attributes(alignment: .center))
            $0.textColor = .black
        }

        menuStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .top
        }

        commentTitleLabel.do {
            $0.attributedText = NSAttributedString(string: "조문 10", attributes: UIFont.body_sb_16.attributes())
            $0.textColor = UIColor(red: 32/255, green: 32/255, blue: 34/255, alpha: 1)
        }

        commentStackView.do {
            $0.axis = .vertical
            $0.spacing = 0
        }
    }

    private func setUI() {
        view.addSubviews(navigationBar, scrollView, commentInputView)
        scrollView.addSubview(contentView)

        contentView.addSubviews(cardView, menuStackView, commentTitleLabel, commentStackView)

        cardView.addSubviews(memorialImageView, nameLabel, divider1, causeOfDeathTitleLabel, causeOfDeathLabel, divider2, issueNumberRow, deathDateRow)

        ["부활", "고이 보내기", "유산 넘기기"].forEach {
            menuStackView.addArrangedSubview(CircleMenuItemView(title: $0))
        }

        let dummies = [
            ("민수", "그렇게 될 줄 알았다 ㅋㅋㅋ", "10분 전"),
            ("민수", "그렇게 될 줄 알았다 ㅋㅋㅋ", "10분 전")
        ]
        dummies.forEach { name, message, time in
            commentStackView.addArrangedSubview(CommentCell(name: name, message: message, time: time))
        }
    }

    private func setLayout() {
        navigationBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }

        commentInputView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
        }

        scrollView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(commentInputView.snp.top)
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(280)
            $0.height.equalTo(360)
        }

        memorialImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(18)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(142)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(memorialImageView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }

        divider1.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(1)
        }

        causeOfDeathTitleLabel.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }

        causeOfDeathLabel.snp.makeConstraints {
            $0.top.equalTo(causeOfDeathTitleLabel.snp.bottom).offset(2)
            $0.centerX.equalToSuperview()
        }

        divider2.snp.makeConstraints {
            $0.top.equalTo(causeOfDeathLabel.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(18)
            $0.height.equalTo(1)
        }

        issueNumberRow.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(18)
        }

        deathDateRow.snp.makeConstraints {
            $0.top.equalTo(issueNumberRow.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(18)
        }

        menuStackView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(60)
        }

        commentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(menuStackView.snp.bottom).offset(40)
            $0.leading.equalToSuperview().inset(16)
        }

        commentStackView.snp.makeConstraints {
            $0.top.equalTo(commentTitleLabel.snp.bottom).offset(6)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(24)
        }
    }
}
