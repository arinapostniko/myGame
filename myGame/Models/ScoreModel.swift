//
//  ScoreModel.swift
//  myGame
//
//  Created by Arina Postnikova on 15.11.22.
//

import Foundation

struct ScoreModel: Codable {
    var score: Int
    var date: String
}

extension ScoreModel: Comparable {
    static func < (lhs: ScoreModel, rhs: ScoreModel) -> Bool {
        lhs.score < rhs.score
    }
}
