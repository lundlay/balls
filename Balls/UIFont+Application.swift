//
//  UIFont+Application.swift
//  Balls
//
//  Created by Oleg Lavronov on 5/18/19.
//  Copyright © 2019 Lundlay. All rights reserved.
//
import UIKit

extension UIFont {
    
    // 16pt
    class var label: UIFont {
        let font = sourceSansPro(16)
        return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: font)
    }

    // 18pt
    class var button: UIFont {
        let font = sourceSansProSemibold(18)
        return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: font)
    }

    // 18pt
    class var buttonArial: UIFont {
        let font = sourceSansProSemibold(18)
        return UIFontMetrics(forTextStyle: .caption1).scaledFont(for: font)
    }

    //SourceSansPro-Regular
    class func sourceSansProSemibold(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Semibold", size: size) else {
            fatalError("""
                       Failed to load the font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
        }
        return font
    }

    //SourceSansPro-Regular
    class func sourceSansPro(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "SourceSansPro-Regular", size: size) else {
            fatalError("""
                       Failed to load the font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
        }
        return font
    }
    
    //arlrdbd
    class func arlrdbd(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: "arlrdbd", size: size) else {
            fatalError("""
                       Failed to load the font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """)
        }
        return font
    }

}
