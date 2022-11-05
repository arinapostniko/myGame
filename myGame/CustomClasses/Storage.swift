//
//  Storage.swift
//  myGame
//
//  Created by Arina Postnikova on 5.11.22.
//

import Foundation

class Storage {
    static var shared = Storage()
    
    private var storage = UserDefaults.standard
    
    var scores: [Int] {
        get {
            storage.array(forKey: "scoreKey") as? [Int] ?? []
        }
        set {
            storage.set(newValue, forKey: "scoreKey")
        }
    }
}
