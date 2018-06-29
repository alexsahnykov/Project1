//
//  detailTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 29/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import SafariServices
class detailTableViewController: UITableViewController,SFSafariViewControllerDelegate {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var textLable: UITextView!

    @IBOutlet weak var linkButton: UIButton!
    var DetailName = "name"
    var DetailTitle = "title"
    var DetailLink = "link"
    
    @IBAction func sdad(_ sender: Any) {
        if let URL = URL(string: DetailLink) {
            let svc = SFSafariViewController(url: URL)
            self.present(svc, animated: true, completion: nil)
        } else {
            let ac = UIAlertController(title: "Ошибка", message: "Заполните имя языка пожалуйста", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
            present(ac, animated: true, completion: nil)
            ac.addAction(cancel)
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


