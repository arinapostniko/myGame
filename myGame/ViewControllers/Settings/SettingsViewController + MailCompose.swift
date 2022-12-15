//
//  SettingsViewController + MailCompose.swift
//  myGame
//
//  Created by Arina Postnikova on 24.11.22.
//

import Foundation
import MessageUI

extension SettingsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
