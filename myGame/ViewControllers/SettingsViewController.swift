//
//  SettingsViewController.swift
//  myGame
//
//  Created by Arina Postnikova on 19.11.22.
//

import UIKit
import MessageUI

class SettingsViewController: UIViewController {

    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func reportButton(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["arinapostniko@icloud.com"])
            mail.setSubject("Feedback")
            mail.setMessageBody("<h>Report a problem</h>", isHTML: true)
            mail.setCcRecipients(["arinapostnikova123@gmail.com"])
            
            present(mail, animated: true)
        }
    }
}
