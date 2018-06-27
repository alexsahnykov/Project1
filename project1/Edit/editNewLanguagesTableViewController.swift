//
//  editNewLanguagesTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 27/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift
class editNewLanguagesTableViewController: UITableViewController {

    @IBOutlet weak var nameEditTextField: UITextField!
    @IBOutlet weak var titleEditTextField: UITextField!
    @IBOutlet weak var linkEditTextField: UITextField!
    
    @IBAction func editSaveButtonPressed(_ sender: Any) {
    }
    
    var editDetailName = ""
    var editDetailTitle = ""
    var editDetailLink = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
