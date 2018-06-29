//
//  LanguagesTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 21/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

class LanguagesTableViewController: UITableViewController {
    var programmingLanguage: Results<LanguagesList>!
    let item = LanguagesList()
    
    // system
   
    
    @IBOutlet var mainTableView: UITableView!
    
    @IBAction func close(segue:UIStoryboardSegue){
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    @IBAction func addNewLanguagesButton(_ updatedList: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //  Sort after load
    
    override func viewWillAppear(_ animated: Bool) {
  
        programmingLanguage = realm.objects(LanguagesList.self)
        self.programmingLanguage = self.programmingLanguage.sorted(byKeyPath: "createdAt", ascending:false)
        
        self.tableView.setEditing(false, animated: true)
        self.tableView.reloadData()
        }



   
    //Delete and edit options
    
   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
   
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
        let item = self.programmingLanguage[indexPath.row]
        try! realm.write({
            realm.delete(item)
        })
        
        tableView.deleteRows(at:[indexPath], with: .automatic)
    }
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            let languageToBeUpdated = self.programmingLanguage[indexPath.row]
            self.performSegue(withIdentifier: "editSegue", sender: languageToBeUpdated)
        }
    edit.backgroundColor = #colorLiteral(red: 0, green: 0.4117647059, blue: 0.8509803922, alpha: 1)
    delete.backgroundColor = #colorLiteral(red: 0.9152866006, green: 0.246553123, blue: 0.2010768652, alpha: 1)

    return [edit,delete]
    }

    
   
    // Table view data source
 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let item = programmingLanguage[indexPath.row]
        cell.textLabel!.text = item.nameLanguages
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return programmingLanguage.count
    }
    
    
        // Sort
    
    @IBAction func didSelectSortCriteria(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            self.programmingLanguage = self.programmingLanguage.sorted(byKeyPath: "createdAt",ascending:false)
            }
        else {
            self.programmingLanguage = self.programmingLanguage.sorted(byKeyPath: "nameLanguages")
            }
        self.tableView.reloadData()
}
  
  
        // Segue
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let name = programmingLanguage[indexPath.row].nameLanguages
                let title = programmingLanguage[indexPath.row].titleLanguages
                let link = programmingLanguage[indexPath.row].linkLanguages
                
                let destinationViewController = segue.destination as!  detailTableViewController
                destinationViewController.DetailName = name
                destinationViewController.DetailTitle = title
                destinationViewController.DetailLink = link
                
 
            }
        }
        
        if segue.identifier == "editSegue" {
            let dvc = (segue.destination as! UINavigationController).topViewController as! editNewLanguagesTableViewController
            
                let object = sender as! LanguagesList
                
                let editName = object.nameLanguages
                let editTitle = object.titleLanguages
                let editLink = object.linkLanguages
                
                dvc.editDetailName = editName
                dvc.editDetailTitle = editTitle
                dvc.editDetailLink = editLink
                dvc.languagesToDelete = object
            
}
}
}
