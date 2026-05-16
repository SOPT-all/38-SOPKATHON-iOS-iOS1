//
//  SecondHomeViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class SecondHomeViewController: UIViewController {

    // MARK: - UI

    private let dimView = DimView()

    private let containerView = UIView().then {
        $0.backgroundColor = UIColor(
            red: 48/255,
            green: 48/255,
            blue: 48/255,
            alpha: 1
        )

        $0.layer.cornerRadius = 16
        $0.clipsToBounds = true
    }

    private let headerView = UIView().then {
        $0.backgroundColor = UIColor(
            red: 236/255,
            green: 232/255,
            blue: 97/255,
            alpha: 1
        )
    }

    private let titleLabel = UILabel().then {
        $0.text = "사망진단서"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 18, weight: .bold)
        $0.textAlignment = .center
    }

    private let closeButton = UIButton(type: .system).then {
        $0.setImage(
            UIImage(systemName: "xmark"),
            for: .normal
        )

        $0.tintColor = .black
    }

    private let flowerImageView = UIImageView().then {
        $0.image = UIImage(named: "flowerImg")
        $0.contentMode = .scaleAspectFit
    }

    private let goalLabel = UILabel().then {
        $0.text = "(故) 다이어트"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textAlignment = .center
    }

    private let infoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 16
    }

    private let funeralButton = UIButton(type: .system).then {
        $0.setTitle("조문하기", for: .normal)

        $0.setTitleColor(.black, for: .normal)

        $0.titleLabel?.font = .systemFont(
            ofSize: 16,
            weight: .semibold
        )

        $0.backgroundColor = .white
        $0.layer.cornerRadius = 12
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setAction()
    }
}

// MARK: - Private Extension

private extension SecondHomeViewController {

    func setStyle() {
        view.backgroundColor = .clear
    }

    func setUI() {
        view.addSubview(dimView)
        view.addSubview(containerView)

        containerView.addSubview(headerView)

        headerView.addSubview(titleLabel)
        headerView.addSubview(closeButton)

        containerView.addSubview(flowerImageView)
        containerView.addSubview(goalLabel)
        containerView.addSubview(infoStackView)
        containerView.addSubview(funeralButton)

        infoStackView.addArrangedSubview(
            makeInfoView(
                title: "상주",
                value: "김솝트"
            )
        )

        infoStackView.addArrangedSubview(
            makeInfoView(
                title: "사망 원인",
                value: "밥을 많이 먹어서"
            )
        )

        infoStackView.addArrangedSubview(
            makeInfoView(
                title: "사망 경과",
                value: "D+1"
            )
        )
    }

    func setLayout() {

        dimView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        containerView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(560)
        }

        headerView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(64)
        }

        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }

        closeButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(24)
        }

        flowerImageView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(160)
        }

        goalLabel.snp.makeConstraints {
            $0.top.equalTo(flowerImageView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }

        infoStackView.snp.makeConstraints {
            $0.top.equalTo(goalLabel.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
        }

        funeralButton.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(54)
            $0.bottom.equalToSuperview().inset(20)
        }
    }

    func setAction() {

        closeButton.addTarget(
            self,
            action: #selector(closeButtonDidTap),
            for: .touchUpInside
        )

        funeralButton.addTarget(
            self,
            action: #selector(closeButtonDidTap),
            for: .touchUpInside
        )
    }

    func makeInfoView(
        title: String,
        value: String
    ) -> UIView {

        let containerView = UIView()

        let titleLabel = UILabel().then {
            $0.text = title
            $0.textColor = .white
            $0.font = .systemFont(
                ofSize: 16,
                weight: .bold
            )
        }

        let valueLabel = UILabel().then {
            $0.text = value
            $0.textColor = .white
            $0.font = .systemFont(
                ofSize: 16,
                weight: .medium
            )
        }

        containerView.addSubview(titleLabel)
        containerView.addSubview(valueLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.verticalEdges.equalToSuperview()
            $0.width.equalTo(90)
        }

        valueLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.trailing.verticalEdges.equalToSuperview()
        }

        return containerView
    }

    @objc
    func closeButtonDidTap() {
        dismiss(animated: true)
    }
}
