//
//  UIBallView.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit

class UIBallView: UIImageView {
    
    let translation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
        animation.values = [-200, 50, 0]
        animation.keyTimes = [0.0, 0.85, 1]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        animation.autoreverses = true
        animation.duration = 3.0
        animation.repeatCount = .infinity
        return animation
    }()

    let scaleXAnimation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.x")
        animation.values = [0.75, 0.75, 1]
        animation.keyTimes = [0.0, 0.85, 1]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.autoreverses = true
        animation.duration = 3.0
        animation.repeatCount = .infinity
        return animation
    }()

    let scaleYAnimation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale.y")
        animation.values = [0.75, 1, 0.85]
        animation.keyTimes = [0.1, 0.5, 1]
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.autoreverses = true
        animation.duration = 3.0
        animation.repeatCount = .infinity
        return animation
    }()
    
    let rotation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.values = [0, -Double.pi * 2]
        animation.duration = 5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        return animation
    }()

    let opacity: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "opacity")
        animation.values = [1, 0.2, 0.0, 0.2, 1]
        animation.keyTimes = [0, 1, 3]
        animation.duration = 3
        animation.autoreverses = true
        animation.repeatCount = .infinity
        return animation
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = frame.width * 0.5
    }

    func startAnimation() {
        layer.add(scaleXAnimation, forKey: "scaleX")
        layer.add(scaleYAnimation, forKey: "scaleY")
        layer.add(translation, forKey: "trans")
        layer.add(rotation, forKey: "rotate")
        layer.add(opacity, forKey: "opacity")
    }
    

}
