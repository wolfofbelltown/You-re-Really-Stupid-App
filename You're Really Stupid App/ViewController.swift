//
//  ViewController.swift
//  You're Really Stupid App
//
//  Created by Warren Mui on 6/30/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func SwitchTo3D(_ sender: UISwitch) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        changeText()
        mySwitch.addTarget(self, action: #selector(switchToggled(_:)), for: UIControlEvents.valueChanged)
    }
    
//    func changeText() {
//        if mySwitch.isOn {
//            //label.text = "Switch is on"
//            print("SWITCH 1")
//        } else {
//            //label.text = "Switch is off"
//            print("SWITCH 2")
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

