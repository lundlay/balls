//
//  UIBallView.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit

class UIBallView: UIImageView {
    
    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.gradientBegin.cgColor, UIColor.gradientEnd.cgColor]
        return layer
    }()

    let scaleAnimation: CAKeyframeAnimation = {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1, 0]
        animation.autoreverses = true
        animation.duration = 5.0
        animation.repeatCount = .infinity
        return animation
    }()
    
    init() {
        super.init(frame: .zero)
        layer.addSublayer(gradientLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.masksToBounds = true
        layer.cornerRadius = frame.width * 0.5
        gradientLayer.frame = bounds
    }

    func startAnimation() {
        layer.add(scaleAnimation, forKey: "scale")
    }

}
