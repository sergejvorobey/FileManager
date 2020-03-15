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
     var arrayJson = [Decodable]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        errorLabel.alpha = 0

               if let humanCurrent = humanCurrent {
                   firstNameTextField.text = humanCurrent.firstName
                   lastNameTextField.text = humanCurrent.lastName
                   ageTextField.text = humanCurrent.age
        }
    }
      
    @IBAction func saveButton(_ sender: UIButton) {
      
        let key = "Users"
        let value = ["User 3": ["firstName": firstNameTextField.text,
                                    "lastName": lastNameTextField.text,
                                    "age": ageTextField.text]
        ]
        let path = Bundle.main.path(forResource: "DataList", ofType: "plist")
        let url = URL(fileURLWithPath: path!)
        let dict = NSMutableDictionary()/* = [firstNameTextField.text:
                                                        ["firstName": firstNameTextField.text,
                                                        "lastName": lastNameTextField.text,
                                                        "age": ageTextField.text]]*/
        dict.setValue(value, forKey: key)
        dict.write(to: url, atomically: false)
//        print(dict)


        let resultDictionary = NSMutableDictionary(contentsOfFile: path!)
        print(resultDictionary as Any)
    }
}

