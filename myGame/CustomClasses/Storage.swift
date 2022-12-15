//
//  Storage.swift
//  myGame
//
//  Created by Arina Postnikova on 5.11.22.
//

import Foundation

class Storage {
    
    // MARK: - Singletone
    static var shared = Storage()
    private init() { }
    
    // MARK: - Public properties
    var hasDefaultValues: Bool {
        get {
            storage.bool(forKey: "hasDefaultValues")
        }
        
        set {
            storage.set(newValue, forKey: "hasDefaultValues")
        }
    }
    
    var scores: [ScoreModel] {
        get {
            guard let data = storage.value(forKey: "scores") as? Data,
                  let scores = try? JSONDecoder().decode([ScoreModel].self, from: data) else {
                    return []
            }
            return scores
        }
        
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "scores")
            }
        }
    }
    
    // MARK: - Private properties
    let storage = UserDefaults.standard
}
