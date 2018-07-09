//
//  PressMeButton.swift
//  You're Really Stupid App
//
//  Created by Warren Mui on 7/8/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//

import UIKit

class PressMeButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let color = UIColor.green
//        let disabledColor = color.withAlphaComponent(0.3)
//        let gradientColor1 = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1).cgColor
//        let gradientColor2 = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1).cgColor
//
//        let btnFont = "Noteworthy"
//        let bthWidth = 200
//        let btnHeight = 60
//
//        self.frame.size = CGSize(width: bthWidth, height: btnHeight)
//        self.frame.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
//
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0

        self.layer.borderColor = color.cgColor
//
//        self.setTitleColor(color, for: .normal)
//        self.setTitleColor(disabledColor, for: .disabled)
//        self.titleLabel?.font = UIFont(name: btnFont, size: 25)
//        self.titleLabel?.adjustsFontSizeToFitWidth = true
//        self.setTitle(self.titleLabel?.text?.capitalized, for: .normal)
//
//        let btnGradient = CAGradientLayer()
//        btnGradient.frame = self.bounds
//        btnGradient.colors = [gradientColor1, gradientColor2]
//        self.layer.insertSublayer(btnGradient, at: 0)
//
//        self.contentEdgeInsets.bottom = 4
//
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        print("You're Stupid!")
    }

}
