//
//  Disclaimer_ViewController.swift
//  You're Really Stupid App
//
//  Created by Kin Jue on 8/20/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//

import UIKit

class Disclaimer_ViewController: UIViewController {

    @IBOutlet var AgreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AgreeButton.layer.cornerRadius = 9

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
