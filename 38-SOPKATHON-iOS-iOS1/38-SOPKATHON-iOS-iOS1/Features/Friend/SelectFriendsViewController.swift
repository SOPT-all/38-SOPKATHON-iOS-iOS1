//
//  SelectFriendsViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//
import UIKit

import SnapKit

final class SelectFriendsTestViewController: UIViewController {

    // MARK: - UI Components

    private let rootView = SelectFriendsView()
    private let customTransitioningDelegate = SelectFriendsTransitioningDelegate.shared
    private let service = FriendService()
    private var friends: [FriendDataDTO] = []

    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = customTransitioningDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycles
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        modalPresentationStyle = .custom
        transitioningDelegate = customTransitioningDelegate
        
        setTableView()
        setAction()
        fetchData()
    }
    
    // MARK: - Private Methods
    
    private func setTableView() {
        rootView.tableView.delegate = self
        rootView.tableView.dataSource = self
        
        rootView.tableView.register(
            SelectFriendsViewCell.self,
            forCellReuseIdentifier: SelectFriendsViewCell.identifier
        )
    }
    
    private func setAction() {
        rootView.closeButton.addTarget(
            self,
            action: #selector(closeButtonDidTap),
            for: .touchUpInside
        )
        rootView.inviteButton.addTarget(
            self,
            action: #selector(inviteButtonDidTap),
            for: .touchUpInside
        )
    }
    @objc
    private func closeButtonDidTap() {
        NotificationCenter.default.post(name: .didDismissSelectFriends, object: nil)
        dismiss(animated: true)
    }
    @objc
    private func inviteButtonDidTap() {
        NotificationCenter.default.post(name: .didDismissSelectFriends, object: nil)
        dismiss(animated: true)
    }
}

extension SelectFriendsTestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friends.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SelectFriendsViewCell.identifier,
            for: indexPath
        ) as? SelectFriendsViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        cell.configure(with: friends[indexPath.section])

        return cell
    }
    
}

extension SelectFriendsTestViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int
    ) -> CGFloat {
        return 12
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int
    ) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }
}

// MARK: - Network

private extension SelectFriendsTestViewController {

    func fetchData() {
        Task {
            do {
                let data = try await service.getFriends(userId: 1)
                await MainActor.run {
                    friends = data
                    rootView.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }
    }
}

extension Notification.Name {
    static let didDismissSelectFriends = Notification.Name("didDismissSelectFriends")
}
