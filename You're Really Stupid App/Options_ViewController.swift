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
        
        // Set up debug file
//        let str = "Super long string here"
//        let filename = getDocumentsDirectory().appendingPathComponent("output.txt")
//        do {
//            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
//            print(filename)
//        } catch {
//            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
//        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // https://codewithchris.com/uipickerview-example/
    // Sets the number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    // Returns data for specified row and column
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return languages[row]
    }
    // Sets the number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return languages.count
    }
    // Delegate method used to detect what user has selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        Language.text = languages[row]
        #if DEBUG_Options
        print("DEBUG_Options: ",Language.text!)
        #endif
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
