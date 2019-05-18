//
//  SecondViewController.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...50 {
            let maxX = max(view.frame.width, view.frame.height)
            let x = CGFloat.random(in: 10 ... maxX) - 20
            let y = CGFloat.random(in: 10 ... maxX) - 20
            let radius = CGFloat.random(in: 10 ... 50)
            
            let ball = UIBallView(image: UIImage(named: "image-ball")?.withRenderingMode(.alwaysTemplate))
            ball.contentMode = .scaleAspectFill
            ball.frame = CGRect(x: x, y: y, width: radius, height: radius)
            ball.alpha = 0
            ball.tintColor = UIColor.random()
            
            view.addSubview(ball)
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.1 ... 3)) {
                ball.startAnimation()
                UIView.animate(withDuration: 3) {
                    ball.alpha = 1
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for case let ball as UIBallView in view.subviews {
            ball.startAnimation()
        }
    }


}

