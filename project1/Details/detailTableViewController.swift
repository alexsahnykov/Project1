//
//  detailTableViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 29/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var textLable: UITextView!
    @IBOutlet weak var linkLable: UILabel!
    var DetailName = "name"
    var DetailTitle = "title"
    var DetailLink = "link"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLable.text = DetailName
        textLable.text = DetailTitle
        linkLable.text = DetailLink
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    }


