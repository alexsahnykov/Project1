//
//  AddNewLanguagesTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 26/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

class AddNewLanguagesTableViewController: UITableViewController {
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var nameTextField: UITextField!
    
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        if ((nameTextField.text?.isEmpty)! || nameTextField.text == " ") {
            print ("Не все поля заполнены!")
        } else {
            let LanguagesItem = LanguagesList()
            LanguagesItem.nameLanguages = nameTextField.text!
            
            // We are adding the reminder to our database
            try! uiRealm.write({
                uiRealm.add(LanguagesItem)
            })
        }
        performSegue(withIdentifier: "unwindSegueFromNewCell", sender: self) //save segue to main viev
    }
    


}
