//
//  MainViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 1.10.22.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.alpha = 0
        startButton.alpha = 0
        
        backgroundImage.makeBlur()
        
        UIView.animate(withDuration: 1, delay: 1.2, options: .curveEaseInOut, animations: {
            self.logo.alpha = 1
            self.startButton.alpha = 1
        }, completion: { _ in
        })
        
        logo.makeShadow(shadowOpacity: 0.3,shadowOffset: CGSize(width: 5, height: 5), shadowRadius: 0)
        
//        let myAttribute = [
//                    NSAttributedString.Key.font: UIFont(name: "Ubuntu", size: 50.0)!,
//                    NSAttributedString.Key.foregroundColor: UIColor.white
//                ]
//                let myString = NSMutableAttributedString(string: "Coins: ", attributes: myAttribute )
//
//                let coinsValue = NSAttributedString(string: "\(coins)")
//                myString.append(coinsValue)

    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: BackgroundImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var logo: LogoView!
    
    // MARK: - IBActions
    @IBAction func presentSecondViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController,
        let navigationController = navigationController else { return }
        
        navigationController.pushViewController(destinationViewController, animated: true)
    }
    
}
