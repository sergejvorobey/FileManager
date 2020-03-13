//
//  EditViewController.swift
//  FileManager
//
//  Created by Sergey Vorobey on 13/03/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var saveButtonLabel: UIButton!
    
    var humanCurrent: UserDataPlist?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0

               if let humanCurrent = humanCurrent {
                   firstNameTextField.text = humanCurrent.firstName
                   lastNameTextField.text = humanCurrent.lastName
                   ageTextField.text = humanCurrent.age
        }
    }
    var userData = [UserDataPlist]()
    
    func plistWrite(plistName: String, key: String, data: AnyObject?) {
        
                  let path = Bundle.main.path(forResource: "DataList", ofType: "plist")

                   let fileManager = FileManager.default
        
                   if !(fileManager.fileExists(atPath: path!)) {
                    
                       if let bundlePath = Bundle.main.path(forResource: plistName, ofType: "plist") {
                        
                          do {
                           try fileManager.copyItem(atPath: bundlePath, toPath: path!)
                            
                          } catch let error as NSError {
                              print("Can't move plist from bundle to documents directory: " + error.localizedDescription)
                          }
                      
                      }
                  }

                   if let savedStock = NSMutableDictionary(contentsOfFile: path!) {
//                    print(savedStock)
                       
                    savedStock.setObject(data!, forKey: key as NSCopying)
                    savedStock.write(toFile: path!, atomically: true)
                   print(savedStock)
                    
                }
            }
        
        
    
    @IBAction func saveButton(_ sender: UIButton) {
        
//        let path = Bundle.main.path(forResource: "DataList", ofType: "plist")
//        let dict = NSDictionary(contentsOfFile: path!)
        plistWrite(plistName: "DataList", key: "Users", data: "User 3" as? AnyObject)
           
    }
}
