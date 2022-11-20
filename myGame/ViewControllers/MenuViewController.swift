//
//  MainViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 1.10.22.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: BackgroundImageView!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var scoresButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var logo: LogoView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.alpha = 0
        startButton.alpha = 0
        scoresButton.alpha = 0
        settingsButton.alpha = 0
        
        backgroundImage.makeBlur()
        logo.makeShadow(shadowOpacity: 0.3,shadowOffset: CGSize(width: 5, height: 5), shadowRadius: 0)
        
        UIView.animate(withDuration: 1, delay: 1.2, options: .curveEaseInOut, animations: {
            self.logo.alpha = 1
            self.startButton.alpha = 1
            self.scoresButton.alpha = 1
            self.settingsButton.alpha = 1
        }, completion: { _ in
        })
    }
    
    // MARK: - IBActions
    @IBAction func presentSecondViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? GameViewController,
        let navigationController = navigationController else { return }
        navigationController.pushViewController(destinationViewController, animated: true)
    }
    
    @IBAction func presentScoresViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "ScoreViewController") as? ScoreViewController,
        let navigationController = navigationController else { return }
        navigationController.pushViewController(destinationViewController, animated: true)
    }
    
    @IBAction func presentSettingsViewController(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let destinationViewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController,
        let navigationController = navigationController else { return }
        navigationController.pushViewController(destinationViewController, animated: true)
    }
    
}

