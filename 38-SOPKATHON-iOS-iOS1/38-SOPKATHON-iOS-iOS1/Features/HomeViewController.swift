//
//  HomeViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/17/26.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {

    // MARK: - Section

    private enum Section: Int, CaseIterable {
        case ongoing
        case ended
        case completed

        var title: String {
            switch self {
            case .ongoing:
                return "현재 진행 중인 목표"
            case .ended:
                return "세상을 떠난 목표"
            case .completed:
                return "완료한 목표"
            }
        }
    }
    // MARK: - Dummy Data

    private let ongoingGoals: [(String, String, Int)] = [
        ("profileImg", "민수", 10),
        ("profileImg", "민수", 10),
        ("profileImg", "민수", 10)
    ]

    private let endedGoals: [(String, String, Int)] = [
        ("profileImg", "민수", 10),
        ("profileImg", "민수", 10),
        ("profileImg", "민수", 10)
    ]

    // MARK: - UI

    private let titleLabel = UILabel().then {
        $0.text = "목표 설정"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 24, weight: .bold)
    }

    private let subTitleLabel = UILabel().then {
        $0.text = "미루다 세상을 떠난 일들"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }

    private let plusButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .darkGray
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 22
    }

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = 80
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setTableView()
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        guard let section = Section(rawValue: section) else { return 0 }

        switch section {
        case .ongoing:
            return ongoingGoals.count
        case .ended:
            return endedGoals.count
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MemorySpaceCell.identifier,
            for: indexPath
        ) as? MemorySpaceCell else {
            return UITableViewCell()
        }

        let data: (String, String, Int)

        switch Section(rawValue: indexPath.section) {
        case .ongoing:
            data = ongoingGoals[indexPath.row]
        case .ended:
            data = endedGoals[indexPath.row]
        case .none:
            return UITableViewCell()
        }

        cell.configure(
            profileImageName: data.0,
            name: data.1,
            goalCount: data.2
        )

        return cell
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return section == 0 ? 56 : 72
    }

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let section = Section(rawValue: section) else { return nil }

        let headerView = UIView()
        headerView.backgroundColor = .white

        let titleLabel = UILabel().then {
            $0.text = section.title
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 16, weight: .bold)
        }

        headerView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }

        return headerView
    }
}

// MARK: - Private Extension

private extension HomeViewController {

    func setStyle() {
        view.backgroundColor = .white
    }

    func setUI() {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(plusButton)
        view.addSubview(tableView)
    }

    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(48)
            $0.leading.equalToSuperview().offset(16)
        }

        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(titleLabel)
        }

        plusButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(44)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }

    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            MemorySpaceCell.self,
            forCellReuseIdentifier: MemorySpaceCell.identifier
        )
    }
}
