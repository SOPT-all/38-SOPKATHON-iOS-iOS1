//
//  SetGoalViewController.swift
//  38-SOPKATHON-iOS-iOS1
//
//  Created by 장지인 on 5/17/26.
//
import UIKit

final class SetGoalPresentationController: UIPresentationController {
    
    // MARK: - UI Components
    
    private let dimmedView = UIView()
    private let dimView = DimView()
    
    // MARK: - Properties
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard let containerView else { return .zero }
        
        let size = CGSize(width: 343, height: 440)
        
        let origin = CGPoint(
            x: (containerView.bounds.width - size.width) / 2,
            y: (containerView.bounds.height - size.height) / 2
        )
        
        return CGRect(origin: origin, size: size)
    }
    
    // MARK: - Life Cycles
    
    override func presentationTransitionWillBegin() {
        guard let containerView else { return }

        dimmedView.backgroundColor = .clear
        dimmedView.frame = containerView.bounds
        dimmedView.alpha = 0

        containerView.insertSubview(dimmedView, at: 0)

        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 1
        }
    }
    
    override func dismissalTransitionWillBegin() {
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dimmedView.removeFromSuperview()
            self.dimView.removeFromSuperview()
        }
    }
}
