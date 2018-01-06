//
//  CategoryViewController.swift
//  TodoeyZein
//
//  Created by zeinMac on 1/6/18.
//  Copyright © 2018 Mohammad Zein. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    ///MARK:- TableView DataSource Methods
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let item = categories[indexPath.row]
        cell.textLabel?.text = item.name
        
        return cell
    }
    
    
    //MARK:- Data Manipulation Methods
    
    
    func saveItems() {
        
        do {
            try context.save()
        }catch{
            print("\(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems(request: NSFetchRequest<Category> = Category.fetchRequest()) {  //if we don't pass an argument, default value is Item.fetchRequest()
        
        do{
            categories = try context.fetch(request)
        }catch{
            print(error)
        }
        
    }
    
    
    //MARK:- Add new Categories


    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new todoey Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            // What happens when add Item is pressed (Completetion handler)
            
            print("Add Item is pressed")
            print(textField.text!)
            
            let newItem = Category(context: self.context)
            newItem.name = textField.text!
            
            self.categories.append(newItem)
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new Category"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }
    
    
    
    //MARK:- TableView Delegate Methods
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! TodoListViewController
        
        
        if  let indexPath = tableView.indexPathForSelectedRow {
            
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
    }

}
