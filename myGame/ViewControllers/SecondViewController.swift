//
//  SecondViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 1.10.22.
//
import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - Private properties
    private let carViewImage = UIImage(named: "car")
    private lazy var carView = UIImageView(image: carViewImage)
    private var carSize: CGFloat = 0
    private var defaultSpacing: CGFloat = 0
    
    private let policeViewImage = UIImage(named: "police")
    private lazy var policeView = UIImageView(image: policeViewImage)
    
    private let locations = [Location.left, Location.center, Location.right]
    
    private var isFirstLoad = true
    
    private var carLocation: Location = .center {
        willSet (newLocation) {
            layoutCar(at: newLocation)
        }
    }
    
    private var isGaming = true
    
    // MARK: - IBOutlets
    @IBOutlet weak var roadTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var roadBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var roadImageView: UIImageView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if isFirstLoad {
            carSize = 100
            defaultSpacing = (view.frame.width - carSize * 3) / 4
            
            setupCar()
            view.addSubview(carView)
            layoutCar(at: .center)
            carView.contentMode = .scaleAspectFit
            
            setupPolice()
            view.addSubview(policeView)
            
            isFirstLoad = false
            
            intersects()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateCops()
        animateRoad()
    }
    
    // MARK: - Private methods
    private func setupCar() {
        carView.frame = CGRect(
            x: getOriginX(for: .center),
            y: (view.frame.size.height - carSize) / 2,
            width: 100,
            height: 150
        )
        
        addSwipeGesture(to: carView, direction: .left)
        addSwipeGesture(to: carView, direction: .right)
    }
    
    private func setupPolice() {
        policeView.frame = CGRect(
            x: getOriginX(for: locations.randomElement()!),
            y: view.frame.size.height,
            width: 100,
            height: 150
        )
    }
    
    private func animateCops() {
        guard isGaming else { return }
        UIView.animate(
            withDuration: 5,
            delay: 3,
            options: [.curveLinear],
            animations: {
            self.policeView.frame.origin.y -= (self.view.frame.size.height + 150)
        }, completion: { _ in
            self.policeView.frame.origin.x = self.getOriginX(for: self.locations.randomElement()!)
            self.policeView.frame.origin.y += (self.view.frame.size.height + 150)
            self.animateCops()
        })
    }
    
    private func layoutCar(at location: Location) {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: .curveEaseInOut
        ) {
            self.carView.frame.origin.x = self.getOriginX(for: location)
        }
    }
    
    private func layoutPolice(at location: Location) {
            self.policeView.frame.origin.x = self.getOriginX(for: location)
    }
    
    private func getOriginX(for location: Location) -> CGFloat {
        switch location {
        case .left:
            return defaultSpacing
        case .center:
            return defaultSpacing * 2 + carSize
        case .right:
            return defaultSpacing * 3 + carSize * 2
        }
    }
    
    private func intersects() {
        guard isGaming else { return }
        if checkIntersect(carView, policeView) {
            print("GAME OVER")
            policeView.layer.removeAllAnimations()
            roadImageView.layer.removeAllAnimations()
            showGameOverAlert(
                withTitle: "Game over",
                message: "You can go back to the main menu and start a new game."
            )
            isGaming = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.intersects()
        }
    }
    
    private func checkIntersect(_ firstView: UIView, _ secondView: UIView) -> Bool {
        guard let firstFrame = firstView.layer.presentation()?.frame,
              let secondFrame = secondView.layer.presentation()?.frame else { return false }
        
        return firstFrame.intersects(secondFrame)
    }

    private func addSwipeGesture(
        to view: UIImageView,
        direction: UISwipeGestureRecognizer.Direction
    ) {
        let swipeGesture = UISwipeGestureRecognizer(
            target: self,
            action: #selector(moveCar)
        )
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
        carView.isUserInteractionEnabled = true
    }
    
    private func animateRoad() {
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            options: [.curveLinear, .repeat],
            animations: {
                self.roadTopConstraint.constant += 144
                self.roadBottomConstraint.constant -= 144
                self.view.layoutIfNeeded()
            }
        )
    }
    
    private func showGameOverAlert(withTitle title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "Start new game", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    @objc private func moveCar(_ gestureRecognizer: UISwipeGestureRecognizer) {
        switch gestureRecognizer.direction {
        case .left:
            if carLocation == .center { carLocation = .left }
            if carLocation == .right { carLocation = .center }
        case .right:
            if carLocation == .center { carLocation = .right }
            if carLocation == .left { carLocation = .center }
        default:
            return
        }
    }

}