//
//  UIColor+Application.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int, alpha: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        assert(alpha >= 0 && alpha <= 255, "Invalid alpha component")
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: CGFloat(alpha) / 255.0)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 24) & 0xFF, green: (hex >> 16) & 0xFF, blue: (hex >> 8) & 0xFF, alpha: hex & 0xFF)
    }
    
    convenience init(hex: UInt) {
        self.init(red: (Int(hex) >> 24) & 0xFF,
                  green: (Int(hex) >> 16) & 0xFF,
                  blue: (Int(hex) >> 8) & 0xFF,
                  alpha: Int(hex) & 0xFF)
    }
    
    convenience init(hex: String) {
        self.init(hex: Int(hex, radix: 16) ?? 0)
    }

    class func random() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
    open class var gradientBegin: UIColor {
        return UIColor(hex: 0x470068FF)
    }

    open class var gradientEnd: UIColor {
        return UIColor(hex: 0x3A00CBFF)
    }
    
}
