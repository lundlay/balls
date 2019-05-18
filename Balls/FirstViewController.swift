//
//  FirstViewController.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var button1: UIButton = {
        let button = UIButton()
        button.setTitle("Button1", for: .normal)
        button.addTarget(self, action: #selector(actionClick), for: .primaryActionTriggered)
        button.backgroundColor = .black
        return button
    }()

    lazy var button2: UIButton = {
        let button = UIButton()
        button.setTitle("Button2", for: .normal)
        button.addTarget(self, action: #selector(actionClick), for: .primaryActionTriggered)
        button.backgroundColor = .black
        return button
    }()

    let ballView: UIBallView = {
        let view = UIBallView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        view.layer.cornerRadius = 50
        view.alpha = 0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(button1)
        view.addSubview(button2)

        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 160).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -88).isActive = true

        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.leadingAnchor.constraint(equalTo: button1.leadingAnchor).isActive = true
        button2.trailingAnchor.constraint(equalTo: button1.trailingAnchor).isActive = true
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 16).isActive = true

        for _ in 1...50 {
            let x = CGFloat.random(in: 10 ... view.frame.width - 20)
            let y = CGFloat.random(in: 10 ... view.frame.width - 20)
            let radius = CGFloat.random(in: 10 ... 50)

            let ball = UIBallView(frame: CGRect(x: x, y: y, width: radius, height: radius))
            ball.backgroundColor = UIColor.random()
            ball.alpha = 0
            
            view.addSubview(ball)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.1 ... 3)) {
                ball.startAnimation()
                UIView.animate(withDuration: 3) {
                    ball.alpha = 1
                }
            }
        }
        
        view.insertSubview(ballView, at: 0)
        
        ballView.center = view.center
        UIView.animate(withDuration: 3) { [unowned self] in
            self.ballView.alpha = 1
        }
        ballView.startAnimation()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for case let ball as UIBallView in view.subviews {
            ball.startAnimation()
        }
    }
    
    @objc
    func actionClick(sender: UIButton) {
        let controller = UIViewController()
        let buttonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(actionDone))
        
        controller.navigationItem.rightBarButtonItem = buttonDone
        controller.title = sender.title(for: .normal)
        controller.view.backgroundColor = .yellow
        
        let navigationController = UINavigationController(rootViewController: controller)
        present(navigationController, animated: true, completion: nil)
    }

    @objc
    func actionDone() {
        dismiss(animated: true, completion: nil)
    }

}



