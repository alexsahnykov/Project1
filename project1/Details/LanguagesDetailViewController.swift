//
//  LanguagesDatail.swift
//  project1
//
//  Created by Александр Сахнюков on 24/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift


class LanguagesDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   var languages: LanguagesList?
 
    @IBOutlet weak var tableViev: UITableView!
    
    let uiRealm = try! Realm()


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! LanguagesDetailCell
        cell.keyLable!.text = "Язык"
        cell.valueLable.text = languages?.nameLanguages
    
       
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
