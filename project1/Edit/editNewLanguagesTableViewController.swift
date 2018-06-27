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
    var programmingLanguage: Results<LanguagesList>?

    @IBOutlet weak var nameEditTextField: UITextField!
    @IBOutlet weak var titleEditTextField: UITextField!
    @IBOutlet weak var linkEditTextField: UITextField!
    
    @IBAction func editSaveButtonPressed(_ sender: Any) {
    }
    
    var editDetailName = ""
    var editDetailTitle = ""
    var editDetailLink = ""
     var LanguageToDelete = LanguagesList()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameEditTextField.text = editDetailName
        titleEditTextField.text = editDetailTitle
        linkEditTextField.text = editDetailLink
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

}
