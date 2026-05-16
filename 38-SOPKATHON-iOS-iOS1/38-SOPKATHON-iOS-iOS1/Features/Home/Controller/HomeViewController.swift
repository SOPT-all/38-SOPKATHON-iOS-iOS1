import UIKit

import SnapKit
import Then

final class HomeViewController: UIViewController {

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

    private struct Goal {
        let profileImageName: String
        let name: String
        let dDay: Int
    }

    private var ongoingGoals: [Goal] = [
        Goal(profileImageName: "profileImg", name: "목표 이름", dDay: 20),
        Goal(profileImageName: "profileImg", name: "목표 이름", dDay: 20)
    ]

    private var endedGoals: [Goal] = [
        Goal(profileImageName: "profileImg", name: "목표 이름", dDay: 20),
        Goal(profileImageName: "profileImg", name: "목표 이름", dDay: 20)
    ]

    private var completedGoals: [Goal] = [
        Goal(profileImageName: "profileImg", name: "목표 이름", dDay: 20)
    ]

    private let topCardView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    private let bannerImageView = UIImageView().then {
        $0.image = UIImage(named: "bannerImg")
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    private let titleLabel = UILabel().then {
        $0.text = "목표 이루고"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 21, weight: .bold)
    }

    private let subTitleLabel = UILabel().then {
        $0.text = "이루고 싶은 목표를 설정해보세요!"
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 13, weight: .medium)
    }

    private let textStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 6
        $0.alignment = .leading
    }

    private let plusButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "plus"), for: .normal)
        $0.tintColor = .darkGray
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 23
        $0.clipsToBounds = true
    }

    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
        $0.rowHeight = 78
        $0.sectionHeaderTopPadding = 0
    }
    
    private let dimView = DimView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setTableView()
        setButtonAction()
    }
    
    func setButtonAction() {
        plusButton.addTarget(
            self,
            action: #selector(plusButtonDidTap),
            for: .touchUpInside
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(removeDim),
            name: .didDismissSelectFriends,
            object: nil
        )
    }

    @objc
    func plusButtonDidTap() {

        let viewController = SelectFriendsTestViewController()

        dimView.removeFromSuperview()
        dimView.alpha = 1

        dimView.frame = view.bounds
        view.addSubview(dimView)

        UIView.animate(withDuration: 0.3) {
            self.dimView.alpha = 1
        }

        viewController.modalPresentationStyle = .custom
        viewController.modalTransitionStyle = .crossDissolve

        present(viewController, animated: true)
    }
    
    @objc
    private func removeDim() {
        UIView.animate(withDuration: 0.3, animations: {
            self.dimView.alpha = 0
        }, completion: { _ in
            self.dimView.removeFromSuperview()
            self.dimView.alpha = 1
        })
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
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
        case .completed:
            return completedGoals.count
        }
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }

        switch section {
        case .ongoing:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: GoalCheckCell.identifier,
                for: indexPath
            ) as? GoalCheckCell else {
                return UITableViewCell()
            }

            let goal = ongoingGoals[indexPath.row]

            cell.configure(
                name: goal.name,
                dDay: goal.dDay,
                checkStyle: .yellowNo,
                inviteHighlightedImageName: "invite0"
            )

            cell.checkButtonDidTap = { [weak self] in
                self?.moveGoalToCompleted(at: indexPath.row)
            }

            return cell

        case .ended:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: MemorySpaceCell.identifier,
                for: indexPath
            ) as? MemorySpaceCell else {
                return UITableViewCell()
            }

            let goal = endedGoals[indexPath.row]

            cell.configure(
                profileImageName: goal.profileImageName,
                name: goal.name,
                dDay: goal.dDay
            )

            return cell

        case .completed:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: GoalCheckCell.identifier,
                for: indexPath
            ) as? GoalCheckCell else {
                return UITableViewCell()
            }

            let goal = completedGoals[indexPath.row]

            cell.configure(
                name: goal.name,
                dDay: goal.dDay,
                checkStyle: .yellowYes,
                inviteHighlightedImageName: "invite0"
            )

            cell.checkButtonDidTap = { [weak self] in
                self?.moveGoalToOngoing(at: indexPath.row)
            }

            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        section == 0 ? 52 : 70
    }

    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int
    ) -> UIView? {
        guard let section = Section(rawValue: section) else { return nil }

        let headerView = UIView()
        headerView.backgroundColor = .clear

        let titleLabel = UILabel().then {
            $0.text = section.title
            $0.textColor = .white
            $0.font = .systemFont(ofSize: 15, weight: .bold)
        }

        headerView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }

        return headerView
    }
}

// MARK: - Private Extension

private extension HomeViewController {

    func setStyle() {
        view.backgroundColor = .gray900
    }

    func setUI() {
        view.addSubview(topCardView)
        view.addSubview(tableView)

        topCardView.addSubview(bannerImageView)
        topCardView.addSubview(textStackView)
        topCardView.addSubview(plusButton)

        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(subTitleLabel)
    }

    func setLayout() {
        topCardView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(160)
        }
        
        bannerImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        textStackView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().inset(20)
            $0.trailing.lessThanOrEqualTo(plusButton.snp.leading).offset(-20)
        }

        plusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(18)
            $0.centerY.equalTo(textStackView)
            $0.size.equalTo(46)
        }

        tableView.snp.makeConstraints {
            $0.top.equalTo(topCardView.snp.bottom).offset(28)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }
    }

    func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(
            GoalCheckCell.self,
            forCellReuseIdentifier: GoalCheckCell.identifier
        )

        tableView.register(
            MemorySpaceCell.self,
            forCellReuseIdentifier: MemorySpaceCell.identifier
        )
    }

    // MARK: 목표 -> 완료
    func moveGoalToCompleted(at index: Int) {
        guard ongoingGoals.indices.contains(index) else { return }

        let goal = ongoingGoals.remove(at: index)
        completedGoals.append(goal)

        tableView.reloadData()
    }
    
    // MARK: 완료 -> 목표
    func moveGoalToOngoing(at index: Int) {
        guard completedGoals.indices.contains(index) else { return }

        let goal = completedGoals.remove(at: index)
        ongoingGoals.append(goal)

        tableView.reloadData()
    }
}
