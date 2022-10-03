//
//  SecondViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 1.10.22.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    private let circleView = UIView()
    
    private var circleSize: CGFloat = 0
    private var defaultSpacing: CGFloat = 0
    
    private var isFirstLoad = true
    
    private var circleLocation: Location = .center {
        willSet (newLocation) {
            layoutCircle(at: newLocation)
        }
    }

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        if isFirstLoad {
            circleSize = 50
            defaultSpacing = (view.frame.width - circleSize * 3) / 4
            
            setupCircle()
            view.addSubview(circleView)
            layoutCircle(at: .center)
            
            isFirstLoad = false
        }
    }
    
    // MARK: - Private methods
    private func setupCircle() {
        circleView.backgroundColor = .white
        circleView.layer.cornerRadius = circleSize / 2
        circleView.frame = CGRect(
            x: getOriginX(for: .center),
            y: (view.frame.size.height - circleSize) / 2,
            width: circleSize,
            height: circleSize
        )
        
        addSwipeGesture(to: circleView, direction: .left)
        addSwipeGesture(to: circleView, direction: .right)
    }
    private func layoutCircle(at location: Location) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.circleView.frame.origin.x = self.getOriginX(for: location)
        }
        
    }
    
    private func getOriginX(for location: Location) -> CGFloat {
        switch location {
        case .left:
            return defaultSpacing
        case .center:
            return defaultSpacing * 2 + circleSize
        case .right:
            return defaultSpacing * 3 + circleSize * 2
        }
    }

    private func addSwipeGesture(to view: UIView, direction: UISwipeGestureRecognizer.Direction) {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircle))
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func moveCircle(_ gestureRecognizer: UISwipeGestureRecognizer) {
        
        switch gestureRecognizer.direction {
        case .left:
            if circleLocation == .center { circleLocation = .left }
            if circleLocation == .right { circleLocation = .center }
        case .right:
            if circleLocation == .center { circleLocation = .right }
            if circleLocation == .left { circleLocation = .center }
        default:
            return
        }
    }

}
