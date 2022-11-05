//
//  Scores.swift
//  myGame
//
//  Created by Arina Postnikova on 5.11.22.
//

import Foundation

class Scores {
    static var shared = Scores()
    
    func getScores() -> [Int] {
        Array((Set(Storage.shared.scores).sorted(by: >)))
    }
    
    func saveScore(score: Int) {
        var scores = Storage.shared.scores
        scores.append(score)
        Storage.shared.scores = scores
    }
}
