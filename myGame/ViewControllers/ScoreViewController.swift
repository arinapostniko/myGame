//
//  ScoreViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 30.10.22.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = String(UserDefaults.standard.integer(forKey: "firstScore"))
    }
}
