//
//  LanguagesTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 21/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

class LanguagesTableViewController: UITableViewController  {
    let realm = try! Realm()
    
    let item = LanguagesList()
    var programmingLanguage: Results<LanguagesList>?    //
   
   
    func addItemViewControllerDidCancel(_controller: AddLanguagesTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func addLanguage(_ sender: UIBarButtonItem) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let controller = segue.destination as! AddLanguagesTableViewController
   
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        readTasksAndUpdateUI()
            }

    func readTasksAndUpdateUI(){
        programmingLanguage = realm.objects(LanguagesList.self)
        self.tableView.setEditing(false, animated: true)
        self.tableView.reloadData()
            }
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
    }
    
    func load() {
        programmingLanguage = realm.objects(LanguagesList.self)
        tableView.reloadData()
    }
    
    
    func saveLanguagesList(taskToDo:String) {
    }

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
     /*   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { // Delete tableview cell
        if editingStyle == .delete {
            let listToBeDeleted = self.programmingLanguage![indexPath.row]
            try! realm.write{
                realm.delete(listToBeDeleted)
                self.readTasksAndUpdateUI()
                }
            }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    */
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableCell", for: indexPath)
            cell.textLabel?.text = programmingLanguage?[indexPath.row].nameLanguages 
            return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
   


}
    

