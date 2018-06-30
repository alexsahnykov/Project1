
//
//  ProgrammingLanguage.swift
//  project1
//
//  Created by Александр Сахнюков on 24/06/2018.
//Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import Foundation
import RealmSwift

class LanguagesList: Object {
    @objc dynamic var nameLanguages:String = ""
    @objc dynamic var titleLanguages:String = ""
    @objc dynamic var linkLanguages:String = "https://"
    @objc dynamic var createdAt = NSDate()
   
    
   
    convenience init(nameLanguages: String, titleLanguages: String, linkLanguages: String ) {
        self.init()
        self.nameLanguages = nameLanguages
        self.titleLanguages = titleLanguages
        self.linkLanguages = linkLanguages
    }
    override static func primaryKey() -> String? {
        return "nameLanguages"
    }
}


