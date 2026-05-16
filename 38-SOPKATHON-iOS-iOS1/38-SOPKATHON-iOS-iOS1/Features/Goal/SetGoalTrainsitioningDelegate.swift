//
//  SetGoalTrainsitioningDelegate.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//
import UIKit

final class SetGoalTransitioningDelegate: NSObject {
    
    // MARK: - Properties
    
    static let shared = SetGoalTransitioningDelegate()
}

// MARK: - UIViewControllerTransitioningDelegate

extension SetGoalTransitioningDelegate: UIViewControllerTransitioningDelegate {
    
    func presentationController(
        forPresented presented: UIViewController,
        presenting: UIViewController?,
        source: UIViewController
    ) -> UIPresentationController? {
        return SelectFriendsPresentationController(
            presentedViewController: presented,
            presenting: presenting
        )
    }
}
