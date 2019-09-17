//
//  SignInViewController.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {

    let gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [UIColor.gradientBegin.cgColor, UIColor.gradientEnd.cgColor]
        return layer
    }()

    let labelDescription: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString(
            "Get access to convenient payments and sharing bills." +
            "Hesitating or wondering what advantages you can get?", comment: "")
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .label
        return label
    }()

    lazy var buttonSignIn: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Sign In", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(actionClick), for: .primaryActionTriggered)
        button.backgroundColor = .clear
        button.titleLabel?.font = .button
        return button
    }()

    lazy var buttonExplore: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Explore Redde", comment: ""), for: .normal)
        button.addTarget(self, action: #selector(actionClick), for: .primaryActionTriggered)
        button.backgroundColor = UIColor(hex: 0x4B0FE0FF)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = .buttonArial
        return button
    }()
    
    let imageLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "image-logo")
        return imageView
    }()

    let ballView: UIBallView = {
        let view = UIBallView()
        return view
    }()

    let ballViewTopRight: UIBallView = {
        let view = UIBallView()
        view.scaleAnimation.duration = 3.5
        return view
    }()
    
    let ballViewTopLeft: UIBallView = {
        let view = UIBallView()
        view.scaleAnimation.duration = 4.5
        return view
    }()

    let ballViewBottomLeft: UIBallView = {
        let view = UIBallView()
        view.scaleAnimation.duration = 5.5
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear

        view.layer.insertSublayer(gradientLayer, at: 0)

        view.addSubview(ballView)
        view.addSubview(ballViewTopRight)
        view.addSubview(ballViewTopLeft)
        view.addSubview(ballViewBottomLeft)
        view.addSubview(imageLogo)
        view.addSubview(labelDescription)
        view.addSubview(buttonSignIn)
        view.addSubview(buttonExplore)

        ballView.snp.remakeConstraints {
            $0.width.height.equalTo(375)
            $0.center.equalToSuperview()
        }

        labelDescription.snp.remakeConstraints {
            $0.width.equalTo(327)
            $0.center.equalToSuperview()
        }

        imageLogo.snp.remakeConstraints {
            $0.bottom.equalTo(labelDescription.snp.top).offset(-24)
            $0.centerX.equalToSuperview()
        }
        
        buttonSignIn.snp.remakeConstraints {
            $0.leading.trailing.equalTo(view.layoutMargins)
            $0.bottom.equalTo(view.layoutMargins).inset(32)
        }

        buttonExplore.snp.remakeConstraints {
            $0.width.equalTo(327)
            $0.height.equalTo(54)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(labelDescription.snp.bottom).offset(32)
        }
        
        ballViewTopRight.snp.remakeConstraints {
            $0.width.height.equalTo(172)
            $0.top.equalTo(view.snp.top).offset(-30)
            $0.left.equalTo(view.snp.right).offset(-144)
        }
        
        ballViewTopLeft.snp.remakeConstraints {
            $0.width.height.equalTo(172)
            $0.left.equalTo(view.snp.left).offset(-54)
            $0.top.equalTo(view.snp.top).offset(-40)
        }
        
        ballViewBottomLeft.snp.remakeConstraints {
            $0.width.height.equalTo(276)
            $0.top.equalTo(view.snp.bottom).offset(-124)
            $0.left.equalTo(view.snp.left).offset(-30)
        }

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ballView.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.ballViewTopRight.startAnimation()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.ballViewTopLeft.startAnimation()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.ballViewBottomLeft.startAnimation()
        }
    }
    
    /// MARK: Actions
    @objc
    func actionClick() {
        let controller = UIViewController()
        controller.view.backgroundColor = .white
        navigationController?.pushViewController(controller, animated: true)
    }

}
