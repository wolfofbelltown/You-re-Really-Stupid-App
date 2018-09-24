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
    
    // Finds all "m4a" audio files and saves filepaths to an array
    var phrases: [String] = Bundle.main.paths(forResourcesOfType: "m4a", inDirectory: ".")
    
    override func viewDidLoad() {
        
        // Sets up debug file output
        #if DEBUG_Options
            let filename = getDocumentDirectory().appendingPathComponent("DEBUG_Options_ViewController.txt")
            var str = "1: filename = \(filename)"
            do {
//                try (str + "\n").write(to: filename, atomically: true, encoding: String.Encoding.utf8)
                let fileHandle = try FileHandle(forWritingTo: filename)
                fileHandle.seekToEndOfFile()
                fileHandle.write((str + "\n").data(using: .utf8)!)
                fileHandle.closeFile()
                
                let searchString1 = filename.absoluteString
                var result1 = ""
                result1 = searchString1.replacingOccurrences(of: "file://", with: "")
                print("\n", "DEBUG OUTPUT FILE IS LOCATED AT... - ", result1, "\n")
            } catch {
                // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            }
        #endif
        
        var index_counter = 0
        
        // Scrubs for audio filename only by removing filepaths and "m4a" extensions
        for (element) in phrases {
            let searchString = element
            let regexp = "((\\/){1}([a-zA-Z0-9\\.]*))$"
            var result = ""
            
            if let range = searchString.range(of: regexp, options: .regularExpression) {
                result = String(searchString[range])
                result = result.replacingOccurrences(of: "/", with: "")
                result = result.replacingOccurrences(of: ".m4a", with: "")
                phrases[index_counter] = result
                
                #if DEBUG_Options
                str = "2: phrases[\(index_counter)] = \(phrases[index_counter])"
                do {
                    let fileHandle = try FileHandle(forWritingTo: filename)
                    fileHandle.seekToEndOfFile()
                    fileHandle.write((str + "\n").data(using: .utf8)!)
                    fileHandle.closeFile()
                } catch {
                    // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
                }
                #endif
            
            }
            index_counter = index_counter + 1
        }

        super.viewDidLoad()
        
        ReturnButton.layer.cornerRadius = 9
        Phrase.layer.cornerRadius = 9
        Phrase.clipsToBounds = true
        
        #if DEBUG_Options
            str = "3: GlobalVariables.sharedManager.myName = \(GlobalVariables.sharedManager.myName)"
            do {
                let fileHandle = try FileHandle(forWritingTo: filename)
                fileHandle.seekToEndOfFile()
                fileHandle.write((str + "\n").data(using: .utf8)!)
                fileHandle.closeFile()
            } catch {
                // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
            }
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
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
//    func urls(for directory: FileManager.SearchPathDirectory, in domainMask: FileManager.SearchPathDomainMask) -> [URL] {
//
//    }
    
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
