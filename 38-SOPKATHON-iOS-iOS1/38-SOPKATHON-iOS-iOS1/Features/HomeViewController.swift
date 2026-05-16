//
//  ViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 신서연 on 5/16/26.
//

import UIKit

import SnapKit

final class HomeViewController: UIViewController {

    // MARK: - Dummy Data

    private let dummyData: [(String, String, Int)] = [
        ("profile1Img", "김서연", 10),
        ("profileImg", "박지민", 7),
        ("profileImg", "최민수", 15)
    ]

    // MARK: - UI

    private let tableView = UITableView(frame: .zero, style: .plain)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setTableView()
    }
}

private extension HomeViewController {

    func setStyle() {
        view.backgroundColor = .black
    }

    func setUI() {
        view.addSubview(tableView)
    }

    func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }

    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        tableView.rowHeight = 100

        tableView.register(
            MemorySpaceCell.self,
            forCellReuseIdentifier: MemorySpaceCell.identifier
        )
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return dummyData.count
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

        let data = dummyData[indexPath.row]

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

}
