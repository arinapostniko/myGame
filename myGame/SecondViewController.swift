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
    
    private let circleRadius = 25
    
    private var circleLocation: Location = .center {
        willSet (newLocation) {
            layoutCircle(at: newLocation)
        }
    }

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCircle()
        view.addSubview(circleView)
    }
    
    // MARK: - Private methods
    private func setupCircle() {
        circleView.backgroundColor = .white
        circleView.layer.cornerRadius = 25
        circleView.frame = CGRect(
            x: Int(Int(view.frame.size.width) / 2 - circleRadius),
            y: Int(Int(view.frame.size.height) / 2 - circleRadius),
            width: 50,
            height: 50
        )
        
        addSwipeGesture(to: circleView, direction: .left)
        addSwipeGesture(to: circleView, direction: .right)
    }
    
    private func addSwipeGesture(to view: UIView, direction: UISwipeGestureRecognizer.Direction) {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircle))
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
    }
    
    @objc private func moveCircle(_ gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction {
        case .left:
            circleView.frame.origin.x -= 20
        case .right:
            circleView.frame.origin.x += 20
        default:
            return
        }
    }
    
    private func layoutCircle(at location: Location) {
        switch location {
        case .left:
            circleView.frame.origin = CGPoint(
                x: Int(circleRadius),
                y: Int(Int(view.frame.size.height) / 2 - circleRadius)
            )
        case .center:
            circleView.frame.origin = CGPoint(
                x: Int(Int(view.frame.size.width) / 2 - circleRadius),
                y: Int(Int(view.frame.size.height) / 2 - circleRadius)
            )
        case .right:
            circleView.frame.origin = CGPoint(
                x: Int(view.frame.size.width - CGFloat(circleRadius)),
                y: Int(Int(view.frame.size.height) / 2 - circleRadius)
            )
        default:
            return
        }
    }

}
