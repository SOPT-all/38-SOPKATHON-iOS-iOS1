//
//  SetGoalViewContoller.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//
import UIKit

import SnapKit

final class SetGoalViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let rootView = SetGoalView()
    private let customTransitioningDelegate =
    SetGoalTransitioningDelegate.shared
    
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
        
        setAction()
    }
    
    // MARK: - Private Methods
    
    
    private func setAction() {
        rootView.closeButton.addTarget(
            self,
            action: #selector(closeButtonDidTap),
            for: .touchUpInside
        )
        rootView.setGoalButton.addTarget(
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
