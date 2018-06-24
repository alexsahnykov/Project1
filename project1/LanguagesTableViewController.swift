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
    let realm = try! Realm()
   
    var programmingLanguage: Results<LanguagesList>?
   
    let item = LanguagesList()
   
    override func viewWillAppear(_ animated: Bool) {
        readTasksAndUpdateUI()
            }
    
    func readTasksAndUpdateUI(){
        programmingLanguage = uiRealm.objects(LanguagesList.self)
            }
    
    
    @IBAction func addNewLanguagesButton(_ updatedList: Any) {                                   // +Button
        let ac = UIAlertController(title: "Add Languages", message: "Add new Languages", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .default) { action in                
            let textField = ac.textFields?.first?.text
            let newLanguage = LanguagesList()
            newLanguage.nameLanguages = textField!
           
            try! uiRealm.write {
                uiRealm.add(newLanguage)
                }
        self.tableView.reloadData()                                                         // reload table
}
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)        //cancel button
        ac.addTextField {
            text in
            }
        ac.addAction(ok)
        ac.addAction(cancel)
        self.tableView.reloadData()
        present(ac, animated: true , completion: nil)                               // Present alert controller
        
    }
    
        override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveLanguagesList(taskToDo:String) {
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
    
       override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { // Delete tableview cell
        if editingStyle == .delete {
            let listToBeDeleted = self.programmingLanguage![indexPath.row]
            try! uiRealm.write{
                uiRealm.delete(listToBeDeleted)
                self.readTasksAndUpdateUI()
                }
            }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
            let list = programmingLanguage!  [indexPath.row]
            cell.textLabel?.text = list.nameLanguages
            return cell
    }
 
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
    

