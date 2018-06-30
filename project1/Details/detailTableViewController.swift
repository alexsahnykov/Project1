//
//  detailTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 29/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SafariServices
class detailTableViewController: UITableViewController, SFSafariViewControllerDelegate {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var textLable: UITextView!
    @IBOutlet weak var linkButton: UIButton!
    
    var detailLanguages = LanguagesList()
    
    @IBAction func linkButton(sender: AnyObject) {
        if let URL = URL(string: detailLanguages.linkLanguages) {
           
            if  UIApplication.shared.canOpenURL(URL) == true {
                let svc = SFSafariViewController(url: URL)
                self.present(svc, animated: true, completion: nil)
            }
            else
            {    let ac = UIAlertController(title: "Ошибка", message: "Неверно введен URL адрес", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
                present(ac, animated: true, completion: nil)
                ac.addAction(cancel)
        }
            
    }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.text = detailLanguages.nameLanguages
        textLable.text = detailLanguages.titleLanguages
        linkButton.setTitle(detailLanguages.linkLanguages, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


    


