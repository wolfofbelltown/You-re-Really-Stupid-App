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
//        let color = UIColor.green

//        self.layer.cornerRadius = 10.0
//        self.clipsToBounds = true
//        self.layer.borderWidth = 3.0
//
//        self.layer.borderColor = color.cgColor

        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        //hideButton()
    }
    
//    var buttonOn: Bool = false
//
//    func showButton() {
//        self.alpha = 1
//    }
//    func hideButton() {
//        self.alpha = 0
//    }
//
//    func animateButtonPressed(sender: AnyObject){
//
//////        if buttonOn {
////            hideButton()
////            print("animate1")
//////        } else {
//////            showButton()
//////            print("animate2")
//////        }
//
//    }
    
    @objc func onPress() {
        print("You're Stupid!")
    }

}
