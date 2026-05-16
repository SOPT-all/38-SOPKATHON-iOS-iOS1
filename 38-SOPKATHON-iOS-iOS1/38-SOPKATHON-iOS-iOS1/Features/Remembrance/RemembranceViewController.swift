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
    private let leftCornerBand = UIView()
    private let rightCornerBand = UIView()
    private let memorialImageView = UIImageView()
    private let nameLabel = UILabel()
    private let divider1 = UIView()
    private let causeOfDeathTitleLabel = UILabel()
    private let causeOfDeathLabel = UILabel()
    private let divider2 = UIView()
    private let userRow = RemembranceInfoRowView(title: "상주", value: "김솝트")
    private let deathCauseRow = RemembranceInfoRowView(title: "사망 원인", value: "밥을 많이 먹어서")
    private let deathDateRow = RemembranceInfoRowView(title: "사망 경과", value: "D+1")
    private let infoStackView = UIStackView()
    private let causeOfDeathStackView = UIStackView()

    // MARK: - Menu
    private let menuStackView = UIStackView()

    // MARK: - Navigation
    private let navigationBar = RemembranceNavigationBar()

    // MARK: - Comment
    private let commentTitleLabel = UILabel()
    private let commentStackView = UIStackView()
    private let commentInputView = CommentInputView()

    private let service = RemembranceService()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray900
        setStyle()
        setUI()
        setLayout()
        fetchData()
    }

    private func setStyle() {
        cardView.do {
            $0.backgroundColor = .gray700
            $0.layer.cornerRadius = 16
            $0.layer.borderWidth = 10
            $0.layer.borderColor = UIColor.gray800?.cgColor
            $0.clipsToBounds = true
        }

        [leftCornerBand, rightCornerBand].forEach {
            $0.backgroundColor = .gray800
        }
        leftCornerBand.transform = CGAffineTransform(rotationAngle: -.pi / 4)
        rightCornerBand.transform = CGAffineTransform(rotationAngle: .pi / 4)

        memorialImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.image = UIImage(resource: .flower)
            $0.tintColor = .gray
        }

        nameLabel.do {
            $0.attributedText = NSAttributedString(string: "(故) 다이어트", attributes: UIFont.title_b_20.attributes(alignment: .center))
            $0.textColor = .white
        }

        divider1.do { $0.backgroundColor = UIColor.gray500 }
        divider2.do { $0.backgroundColor = UIColor.gray500 }

        causeOfDeathTitleLabel.do {
            $0.attributedText = NSAttributedString(string: "사망원인", attributes: UIFont.body_m_14.attributes(alignment: .center))
            $0.textColor = .white
        }

        causeOfDeathLabel.do {
            $0.attributedText = NSAttributedString(string: "너무 많이 먹어서", attributes: UIFont.body_m_14.attributes(alignment: .center))
            $0.textColor = .gray200
        }

        causeOfDeathStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .center
        }

        infoStackView.do {
            $0.axis = .vertical
            $0.spacing = 8
            $0.alignment = .leading
            }

            menuStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.alignment = .top
            }

            commentTitleLabel.do {
                let fullText = "조문 2"
                let attributedString = NSMutableAttributedString(string: fullText, attributes: UIFont.body_sb_16.attributes())
                attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: fullText.count))

                if let range = fullText.range(of: "2") {
                    let nsRange = NSRange(range, in: fullText)
                    attributedString.addAttribute(.foregroundColor, value: UIColor.yellow ?? .gray, range: nsRange)
                }

                $0.attributedText = attributedString
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

        cardView.addSubviews(leftCornerBand, rightCornerBand, memorialImageView, nameLabel, divider1, causeOfDeathStackView, divider2, infoStackView)
        [causeOfDeathTitleLabel, causeOfDeathLabel].forEach {
            causeOfDeathStackView.addArrangedSubview($0)
        }

        [userRow, deathCauseRow, deathDateRow].forEach {
            infoStackView.addArrangedSubview($0)
        }

        let menuItems: [(title: String, icon: UIImage?)] = [
            ("부활", UIImage(resource: .icCross)),
            ("고이 보내기", UIImage(resource: .icFire)),
            ("유산 넘기기", UIImage(resource: .icLetter))
        ]
        menuItems.forEach {
            menuStackView.addArrangedSubview(CircleMenuItemView(title: $0.title, icon: $0.icon))
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
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(44)
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
            $0.top.equalToSuperview().inset(40)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }

        leftCornerBand.snp.makeConstraints {
            $0.width.equalTo(170)
            $0.height.equalTo(32)
            $0.centerX.equalTo(cardView.snp.leading).offset(60)
            $0.centerY.equalTo(cardView.snp.top).offset(60)
        }

        rightCornerBand.snp.makeConstraints {
            $0.width.equalTo(170)
            $0.height.equalTo(32)
            $0.centerX.equalTo(cardView.snp.trailing).offset(-60)
            $0.centerY.equalTo(cardView.snp.top).offset(60)
        }

        memorialImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(180)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(memorialImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }

        divider1.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }

        causeOfDeathStackView.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }

        divider2.snp.makeConstraints {
            $0.top.equalTo(causeOfDeathStackView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(1)
        }

        infoStackView.snp.makeConstraints {
            $0.top.equalTo(divider2.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(32)
        }

        menuStackView.snp.makeConstraints {
            $0.top.equalTo(cardView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(48)
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

// MARK: - Network

private extension RemembranceViewController {

    func fetchData() {
        Task {
            do {
                let data = try await service.getRemembranceData(userId: 1, goalId: 1)
                bindData(data)
            } catch {
                print(error)
            }
        }
    }

    @MainActor
    func bindData(_ data: RemembranceDataDto) {
        nameLabel.attributedText = NSAttributedString(
            string: "(故) \(data.title)",
            attributes: UIFont.title_b_20.attributes(alignment: .center)
        )

        causeOfDeathLabel.attributedText = NSAttributedString(
            string: data.description,
            attributes: UIFont.body_m_14.attributes(alignment: .center)
        )

        userRow.updateValue(data.owner.nickname)
        deathCauseRow.updateValue(data.description)
        deathDateRow.updateValue(daysSince(data.createdAt))

        let count = data.condolenceCount
        let fullText = "조문 \(count)"
        let attributedString = NSMutableAttributedString(string: fullText, attributes: UIFont.body_sb_16.attributes())
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: NSRange(location: 0, length: fullText.count))
        if let range = fullText.range(of: "\(count)") {
            attributedString.addAttribute(.foregroundColor, value: UIColor.yellow ?? .gray, range: NSRange(range, in: fullText))
        }
        commentTitleLabel.attributedText = attributedString

        commentStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        data.condolences.forEach {
            commentStackView.addArrangedSubview(CommentCell(name: $0.nickname, message: $0.content, time: $0.createdAt))
        }
    }

    private func daysSince(_ dateString: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = formatter.date(from: dateString) else { return "D+0" }
        let days = Calendar.current.dateComponents([.day], from: date, to: Date()).day ?? 0
        return "D+\(days)"
    }
}
