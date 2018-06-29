//
//  AppDelegate.swift
//  project1
//
//  Created by Александр Сахнюков on 15/06/2018.
//  Copyright © 2018 Александр Сахнюков. All rights reserved.
//

import UIKit
import RealmSwift

let realm = try! Realm()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
 
        if !UserDefaults.standard.bool(forKey: "db_install") {
         self.LanguagesInitial()
        
        }
        return true
    }
    
    func LanguagesInitial() {
        let realmInstance = try! Realm()
        try! realmInstance.write {
            realmInstance.add(LanguagesList(nameLanguages: "Swift", titleLanguages: "Swift", linkLanguages: "https://www.apple.com/ru/swift/"))
           
            realmInstance.add(LanguagesList(nameLanguages: "JS", titleLanguages: "JS", linkLanguages: "https://vk.com/daft5"))
           
            realmInstance.add(LanguagesList(nameLanguages: "Ruby", titleLanguages: "Ruby", linkLanguages: "WWW"))
         
            realmInstance.add(LanguagesList(nameLanguages: "Python", titleLanguages: "Python", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "C++", titleLanguages: "C++", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "C#", titleLanguages: "C#", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "PHP", titleLanguages: "PHP", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "Java", titleLanguages: "Java", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "Scala", titleLanguages: "Scala", linkLanguages: "WWW"))
            
            realmInstance.add(LanguagesList(nameLanguages: "Pascal", titleLanguages: "Pascal", linkLanguages: "WWW"))
        }
            UserDefaults.standard.set(true, forKey: "db_install")
    }
    
    
    
    
    
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}




