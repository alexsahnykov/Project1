//
//  adNewLanguageViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 19/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class addNewLanguageViewController: UIViewController {
    @IBOutlet weak var nameTextfField: UITextField!
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        if nameTextfField.text == "" {
            print ("Язык не указан") } else {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.persistentContainer.viewContext {
                let languages = Languages (context: context)
                languages.name = nameTextfField.text
                do {
                    try context.save()
                    print ("Вот это поворот, получилось")
                } catch let error as NSError {
                    print ("Ну и дела \(error),\(error.userInfo)")
                }
            }
            performSegue(withIdentifier: "unwingSegueFromNewLanguage", sender: self)
        }
}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


