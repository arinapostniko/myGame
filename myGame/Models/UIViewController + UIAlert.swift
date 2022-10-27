//
//  UIViewController + UIAlert.swift
//  myGame
//
//  Created by Arina Postnikova on 27.10.22.
//

import UIKit

extension UIViewController {
    func showAlert(
        title: String? = "",
        message: String? = "",
        style: UIAlertController.Style = .alert,
        actions: [UIAlertAction] = []
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: style
        )
        actions.forEach {
            alert.addAction($0)
        }
        present(alert, animated: true)
    }
}
