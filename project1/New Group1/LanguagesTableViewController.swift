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
    
    override func viewWillAppear(_ animated: Bool) {
        readTasksAndUpdateUI()
    }

func readTasksAndUpdateUI(){
    programmingLanguage = realm.objects(LanguagesList.self)
    self.tableView.setEditing(false, animated: true)
    self.tableView.reloadData()
}
    
    @IBAction func close(segue:UIStoryboardSegue){
    }
    
    @IBAction func addNewLanguagesButton(_ updatedList: Any) {                                   // +Button
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
     }
    
 

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
            if let listsTasks = programmingLanguage{
                return listsTasks.count
            }
            return 0
    }
    
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

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
            cell.textLabel?.text = programmingLanguage![indexPath.row].nameLanguages
            return cell
    }
   
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @IBAction func didSelectSortCriteria(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0{
            
            // A-Z
            self.programmingLanguage = self.programmingLanguage.sorted(byKeyPath: "nameLanguages")
            
        }
        else{
            // date
             self.programmingLanguage = self.programmingLanguage.sorted(byKeyPath: "createdAt",ascending:false)
            
        }
self.tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
 /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "" {
            let indexPath = tableView.indexPathForSelectedRow
            let name = programmingLanguage[indexPath!.row].nameLanguages
            let title = programmingLanguage[indexPath!.row].titleLanguages
            let link = programmingLanguage[indexPath!.row].linkLanguages
            
            let destinationDetailViewController = segue.destination as! detailLanguagesViewController
          
            destinationDetailViewController.detailDetailName = name
            destinationDetailViewController.detailDetailTitle = title
            destinationDetailViewController.detailDetailLink = link
        }
        if segue.identifier == "editDetail" {
            let indexPath = tableView.indexPathForSelectedRow
            let name = programmingLanguage[indexPath!.row].nameLanguages
            let title = programmingLanguage[indexPath!.row].titleLanguages
            let link = programmingLanguage[indexPath!.row].linkLanguages
            
            let destinaionEditViewController = segue.destination as! editNewLanguagesTableViewController
            
            destinaionEditViewController.editDetailName = name
            destinaionEditViewController.editDetailTitle = title
            destinaionEditViewController.editDetailLink = link
                    }
            }

*/
}
