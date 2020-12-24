//
//  GameSession.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 07.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import UIKit

class GameSession: Codable {
    let date: Date
    let score: Int
    // Процент прохождения игры.
    let ratioOfRightAnswers: Double
    
    init(date: Date, score: Int, ratioOfRightAnswers: Double) {
        self.date = date
        self.score = score
        self.ratioOfRightAnswers = ratioOfRightAnswers
    }
}

