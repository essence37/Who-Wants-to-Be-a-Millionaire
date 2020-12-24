//
//  UserCustomQuestion.swift
//  Who Wants to Be a Millionaire?.git
//
//  Created by Пазин Даниил on 12.06.2020.
//  Copyright © 2020 Пазин Даниил. All rights reserved.
//

import Foundation

class UserCustomQuestion: Codable {
    let question: String
    let possibleAnswerA: String
    let possibleAnswerB: String
    let possibleAnswerC: String
    let possibleAnswerD: String
    let correctAnswerA: Bool
    let correctAnswerB: Bool
    let correctAnswerC: Bool
    let correctAnswerD: Bool
    let questionDifficulty: Int
    
    init(question: String, possibleAnswerA: String, possibleAnswerB: String, possibleAnswerC: String, possibleAnswerD: String, correctAnswerA: Bool, correctAnswerB: Bool, correctAnswerC: Bool, correctAnswerD: Bool, questionDifficulty: Int) {
        self.question = question
        self.possibleAnswerA = possibleAnswerA
        self.possibleAnswerB = possibleAnswerA
        self.possibleAnswerC = possibleAnswerA
        self.possibleAnswerD = possibleAnswerA
        self.correctAnswerA = correctAnswerA
        self.correctAnswerB = correctAnswerB
        self.correctAnswerC = correctAnswerC
        self.correctAnswerD = correctAnswerD
        self.questionDifficulty = questionDifficulty
    }
    
}




//
//(question: String, possibleAnswerA: String, possibleAnswerB: String, possibleAnswerC: String, possibleAnswerD: String, correctAnswerA: Bool, correctAnswerB: Bool, correctAnswerC: Bool, correctAnswerD: Bool, questionDifficulty: DifficultyLevels) {
//self.question = question
//self.possibleAnswerA = possibleAnswerA
//self.possibleAnswerB = possibleAnswerA
//self.possibleAnswerC = possibleAnswerA
//self.possibleAnswerD = possibleAnswerA
//self.correctAnswerA = correctAnswerA
//self.correctAnswerB = correctAnswerB
//self.correctAnswerC = correctAnswerC
//self.correctAnswerD = correctAnswerD
//self.questionDifficulty = questionDifficulty
