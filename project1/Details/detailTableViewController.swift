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
    var DetailName = "name"
    var DetailTitle = "title"
    var DetailLink = "link"
    
    @IBAction func linkButton(sender: AnyObject) {
        if let URL = URL(string: DetailLink) {
           
            if  UIApplication.shared.canOpenURL(URL) == true {
                let svc = SFSafariViewController(url: URL)
                self.present(svc, animated: true, completion: nil)
            } else
            {  let alert = UIAlertController(title: "Ошибка", message: "Неверно введен URL адрес", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: {
                    _ in
                    self.dismiss(animated: true, completion: nil)
                })
                alert.addAction(ok)
                
                self.present(alert, animated: true, completion: nil)
        }
    }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.text = DetailName
        textLable.text = DetailTitle
        linkButton.setTitle(DetailLink, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


    


