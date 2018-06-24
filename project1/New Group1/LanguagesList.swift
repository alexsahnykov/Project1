
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
    @objc dynamic var nameLanguages = ""
    @objc dynamic var createdAt = NSDate()
    
    
    // Specify properties to ignore (Realm won't persist these)
    
    //  override static func ignoredProperties() -> [String] {
    //    return []
    //  }
}
