//
//  ViewController.swift
//  project1
//
//  Created by Александр Сахнюков on 15/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate , UITableViewDataSource   {
    
    var programmingLanguage = ["Swift","JS","Ruby","Rython","C++","C#","PHP","Java","Scala","Pascal"]
    
    var programmingImages = ["Swift.jpg","JS.jpg","Ruby.jpg","Rython.jpg","C++.jpg","C#.jpg","PHP.jpg","Java.jpg","Scala.jpg","Javav.jpg"]
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programmingLanguage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = programmingLanguage [indexPath.row]
       cell?.imageView?.image = UIImage (named: programmingLanguage [indexPath.row] )
        return cell!
    }
   
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) { // Delete tableview cell
        if editingStyle == .delete {
            self.programmingLanguage.remove(at: indexPath.row)
            self.programmingImages.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
}
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
