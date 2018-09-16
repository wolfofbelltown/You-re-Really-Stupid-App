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
    @IBOutlet var Phrase: UILabel!
    @IBOutlet var DropDown: UIPickerView!
    

    var phrases: [String] = Bundle.main.paths(forResourcesOfType: "m4a", inDirectory: ".")

    override func viewDidLoad() {
        
        var index_counter = 0
        
        for (element) in phrases {
            let searchString = element
            let regexp = "((\\/){1}([a-zA-Z0-9\\.]*))$"
            var result = ""
            print("MINE1 :", result, " and then...", searchString)
            if let range = searchString.range(of: regexp, options: .regularExpression) {
                result = String(searchString[range])
                result = result.replacingOccurrences(of: "/", with: "")
                result = result.replacingOccurrences(of: ".m4a", with: "")
                phrases[index_counter] = result
                print("MINE2 : ", phrases[index_counter])
            }
            print("MINE3 : ", result)
            index_counter = index_counter + 1
        }

        super.viewDidLoad()
        
        ReturnButton.layer.cornerRadius = 9
        Phrase.layer.cornerRadius = 9
        Phrase.clipsToBounds = true
        #if DEBUG_Options
            print("DEBUG_Options: \(GlobalVariables.sharedManager.myName)")
        #endif
        // Do any additional setup after loading the view.
        
        // Loads UIPickerView with last selection. Defaults to "English" set in GlobalVariables.swift
        if let index = phrases.index(where: { $0 == GlobalVariables.sharedManager.myName }) {
            DropDown.selectRow(index, inComponent: 0, animated: false)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    /*
     Descriptions of the following methods are referenced by https://codewithchris.com/uipickerview-example/
     */
    
    // Sets the number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    // Returns data for specified row and column
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return phrases[row]
    }
    // Sets the number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return phrases.count
    }
    // Delegate method used to detect what user has selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // Saves the last selected Language to global variables
           GlobalVariables.sharedManager.myName = phrases[row]
        #if DEBUG_Options
        print("DEBUG_Options: \(GlobalVariables.sharedManager.myName)")
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
