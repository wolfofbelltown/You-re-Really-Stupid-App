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
        
        print("Stupid 3")
        
        let path = Bundle.main.path(forResource: "stupid", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        print("Stupid 3a")
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
    }
    
    @objc func onPress() {
        print("Stupid 4")
        
        player.play()
    }
}
