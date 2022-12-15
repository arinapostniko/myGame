//
//  BlurView.swift
//  myGame
//
//  Created by Arina Postnikova on 20.10.22.
//

import UIKit

protocol BlurView where Self: UIView {
    func makeBlur()
}

extension BlurView {
    func makeBlur() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0
        blurEffectView.tag = 1
        addSubview(blurEffectView)
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut, animations: {
            blurEffectView.alpha = 0.5
        }, completion: nil)
    }
}
