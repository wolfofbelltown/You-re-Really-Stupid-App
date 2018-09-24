//
//  PressMeButton.swift
//  You're Really Stupid App
//
//  Created by Warren Mui on 7/8/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//

import UIKit
import AVFoundation

class PressMeButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var player: AVAudioPlayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Sets audio to user selected phrase which is saved to GlobalVariables.sharedManager.myName
        let path = Bundle.main.path(forResource: GlobalVariables.sharedManager.myName, ofType: "m4a")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        player.play()
    }
}
