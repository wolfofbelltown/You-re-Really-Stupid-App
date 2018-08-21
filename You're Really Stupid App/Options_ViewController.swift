//
//  Options_ViewController.swift
//  You're Really Stupid App
//
//  Created by Kin Jue on 8/20/18.
//  Copyright © 2018 Warren Mui. All rights reserved.
//

import UIKit

class Options_ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var ReturnButton: UIButton!
    @IBOutlet var Language: UILabel!
    @IBOutlet var DropDown: UIPickerView!
    
    var languages = ["English", "Chinese", "Spanish","Korean", "Polish", "Japanese", "Alien"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ReturnButton.layer.cornerRadius = 9
        Language.layer.cornerRadius = 9
        Language.clipsToBounds = true
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return languages[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return languages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        Language.text = languages[row]
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
