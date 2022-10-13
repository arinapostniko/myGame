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
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 5, delay: 3, options: [.curveLinear, .repeat], animations: {
            self.policeView.frame.origin.y -= (self.view.frame.size.height + 150)
        })
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
    
    private func layoutCar(at location: Location) {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
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

    private func addSwipeGesture(to view: UIImageView, direction: UISwipeGestureRecognizer.Direction) {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCar))
        swipeGesture.direction = direction
        view.addGestureRecognizer(swipeGesture)
        carView.isUserInteractionEnabled = true
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
