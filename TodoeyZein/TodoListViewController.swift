//
//  ViewController.swift
//  TodoeyZein
//
//  Created by zeinMac on 12/30/17.
//  Copyright © 2017 Mohammad Zein. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["First thing", "Buy Eggos", "Destroy demorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    //MARK- Tableview Datasorce Methods 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    //MARK- TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
         tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}

