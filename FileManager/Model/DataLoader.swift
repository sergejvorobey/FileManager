//
//  DataLoader.swift
//  FileManager
//
//  Created by Sergey Vorobey on 11/03/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import Foundation

class DataLoader {
    
    var userData = [UserDataPlist]()
    
    init() {
            load()
            sort()
        }
    
    func load() {
        let path = Bundle.main.path(forResource: "DataList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)

            for (_, value) in (dict!["Users"] as? [String: Any])! {
//                print(key,value)
                
                var oneUser: UserDataPlist = UserDataPlist()
                for (localKey, localValue) in ((value as? [String: Any])!) {
                    switch localKey {
                    case "firstName":
                        oneUser.firstName = localValue as? String
                    case "lastName":
                        oneUser.lastName = localValue as? String
                    case "age":
                        oneUser.age = localValue as? String
                    case "userId":
                        oneUser.userId = localValue as? String
                    default:
                        break
                    }
                }
                
            userData.append(oneUser)
        }
    }
    
    func sort() {
        self.userData = self.userData.sorted(by: { $0.age! < $1.age! })
        }
}
