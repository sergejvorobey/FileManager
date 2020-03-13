//
//  MainTableViewController.swift
//  FileManager
//
//  Created by Sergey Vorobey on 11/03/2020.
//  Copyright © 2020 Сергей. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

    let data = DataLoader().userData

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
         
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let human = data[indexPath.row]
        
        cell.textLabel?.text = human.firstName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEdit" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let human = data[indexPath.row]
            let newHumanVC = segue.destination as! EditViewController
            newHumanVC.humanCurrent = human
        }
    }
    
    @IBAction func addUser(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "showEdit", sender: nil)
    }
}
