//
//  ViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 15/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource   {

    var programmingLanguage = ["Swift","JS","Ruby","Python","C++","C#","PHP","Java","Scala","Pascal"]


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programmingLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = programmingLanguage [indexPath.row]
        return cell!
    }
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { // Delete tableview cell
        if editingStyle == .delete {
            self.programmingLanguage.remove(at: indexPath.row)
            }
        tableView.deleteRows(at: [indexPath], with: .fade)
}
    
    @IBAction func close(segue: UIStoryboardSegue) {
    
    }
     override func viewDidLoad() {
        super.viewDidLoad()
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

