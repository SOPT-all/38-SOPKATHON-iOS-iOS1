import UIKit

import SnapKit
import Then

final class SetGoalView: UIView {
    private let modalView = UIView()
    private let titleLabel = UILabel()
    private let titleView = UIView()
    let setGoalButton = ButtonComponents(type: .small, title: "관에 넣기")
    let closeButton = UIButton()

    var goalTitle: String { nameTextField.text ?? "" }
    var goalExpiredAt: String { dateTextField.text ?? "" }
    private let girigotitleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private let nameTextField = MirumTextField()
    private let dateTextField = MirumTextField()
    private let ripImageView = UIImageView()
    private let goalNameStackView = UIStackView()
    private let dateStackView = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setStyle()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        backgroundColor = .gray700
        //backgroundColor = .clear
        
        modalView.do {
            $0.backgroundColor = .gray700
            $0.layer.cornerRadius = 24
            $0.clipsToBounds = true
        }
        
        titleLabel.do {
            $0.text = "목표 추가하기"
            $0.font = UIFont.title_b_18.font
            $0.textAlignment = .center
            $0.textColor = .gray600
        }
        
        titleView.do {
            $0.backgroundColor = .yellow
        }
        
        setGoalButton.do {
            $0.backgroundColor = .white
        }
        
        closeButton.do {
            $0.setImage(UIImage(resource: .icClose), for: .normal)
        }

        ripImageView.do {
            $0.image = UIImage(resource: .icRip)
        }

        girigotitleLabel.do {
            $0.attributedText = NSAttributedString(
                string: "목표 이루고",
                attributes: UIFont.title_b_20.attributes
            )
            $0.textColor = .white
        }

        subtitleLabel.do {
            $0.attributedText = NSAttributedString(
                string: "이루고 싶은 목표를 설정해보세요!",
                attributes: UIFont.body_b_14.attributes
            )
            $0.textColor = .gray200
        }

        nameLabel.do {
            $0.attributedText = NSAttributedString(
                string: "목표 이름",
                attributes: UIFont.caption_m_12.attributes
            )
            $0.textColor = .white
        }

        dateLabel.do {
            $0.attributedText = NSAttributedString(
                string: "목표 날짜",
                attributes: UIFont.caption_m_12.attributes
            )
            $0.textColor = .white
        }

        nameTextField.do {
            $0.placeholder = "복근 만들기"
        }

        dateTextField.do {
            $0.placeholder = "YYYY.MM.DD"
        }

        goalNameStackView.do {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.distribution = .fill
            $0.alignment = .center
        }

        dateStackView.do {
            $0.axis = .horizontal
            $0.spacing = 16
            $0.distribution = .fill
            $0.alignment = .center
        }

        [nameLabel, dateLabel].forEach {
            $0.setContentHuggingPriority(.required, for: .horizontal)
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        }
    }

    private func setUI() {
        addSubviews(
            modalView
        )
        titleView.addSubview(titleLabel)
        
        modalView.addSubviews(
            titleView, closeButton,
            setGoalButton,
            closeButton,ripImageView,girigotitleLabel,subtitleLabel,goalNameStackView,dateStackView
        )

        goalNameStackView.addArrangedSubview(nameLabel)
        goalNameStackView.addArrangedSubview(nameTextField)

        dateStackView.addArrangedSubview(dateLabel)
        dateStackView.addArrangedSubview(dateTextField)
    }

    private func setLayout() {
        modalView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        closeButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(24)
            $0.size.equalTo(24)
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
        
        setGoalButton.snp.makeConstraints {
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
        
        ripImageView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(60)
        }

        girigotitleLabel.snp.makeConstraints {
            $0.top.equalTo(ripImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }

        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(girigotitleLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }

        goalNameStackView.snp.makeConstraints {
            $0.top.equalTo(subtitleLabel.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(244)
        }

        dateStackView.snp.makeConstraints {
            $0.top.equalTo(goalNameStackView.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(244)
            $0.bottom.lessThanOrEqualToSuperview().inset(20)
        }
        
    }
}
