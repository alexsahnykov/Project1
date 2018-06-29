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
 let realm = try! Realm()

    @IBOutlet weak var nameEditTextField: UITextField!
    @IBOutlet weak var titleEditTextField: UITextField!
    @IBOutlet weak var linkEditTextField: UITextField!
    
    @IBAction func editSaveButtonPressed(_ sender: Any) {
            if ((nameEditTextField.text?.isEmpty)! || nameEditTextField.text == " ") {
            let ac = UIAlertController(title: "Ошибка", message: "Заполните имя языка пожалуйста", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            present(ac, animated: true, completion: nil)
            ac.addAction(cancel)
            print ("Не все поля заполнены!")
        } else {
            let LanguagesItem = LanguagesList()
            LanguagesItem.nameLanguages = nameEditTextField.text!
            LanguagesItem.titleLanguages = titleEditTextField.text!
            LanguagesItem.linkLanguages = linkEditTextField.text!
            
            try! realm.write({
                realm.add(LanguagesItem, update: false)})
           
            try! realm.write({
                realm.delete(languagesToDelete)})
            performSegue(withIdentifier: "unwindSegueFromEditCell", sender: self)
   
        }
        
    }
    
    var editDetailName = ""
    var editDetailTitle = ""
    var editDetailLink = ""
    var languagesToDelete = LanguagesList()
   
    
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