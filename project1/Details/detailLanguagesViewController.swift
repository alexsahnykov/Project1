//
//  detailLanguagesViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 26/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

class detailLanguagesViewController: UIViewController {
    var detailDetailName = ""
    var detailDetailTitle = ""
    var detailDetailLink = ""
    
    @IBOutlet weak var detailNameLable: UILabel!
    @IBOutlet weak var titleNameLable: UITextView!
    @IBOutlet weak var linklNameLable: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLable.text = detailDetailName
        titleNameLable.text = detailDetailTitle
        linklNameLable.text = detailDetailLink
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
